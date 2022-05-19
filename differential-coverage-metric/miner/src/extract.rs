use indicatif::ParallelProgressIterator;
use rayon::prelude::*;
use serde::{Deserialize, Serialize};
use std::collections::{HashMap, HashSet};
use std::fs;

use std::iter;
use std::path::{Path, PathBuf};
use std::time::Instant;

#[derive(Serialize, Deserialize)]
pub struct TraceGroup {
    pub id: String,
    pub signal_names: Vec<String>,
    // name of aliased signal and pos of the "original" signal name
    pub aliases: Vec<(String, usize)>,
    pub traces: Vec<SignalTrace>,
}

impl TraceGroup {
    pub fn find_signal(&self, name: &str) -> usize {
        self.signal_names
            .iter()
            .enumerate()
            .find(|(_, n)| *n == name)
            .map(|(i, _)| i)
            .expect("could not find signal!")
    }
}

#[derive(Serialize, Deserialize)]
pub struct SignalTrace {
    pub name: String,
    pub values: Vec<Vec<u64>>,
    pub cycles: u64,
}

impl SignalTrace {
    pub fn get(&self, cycle: u64, pos: usize) -> Option<u64> {
        if cycle >= self.cycles {
            return None;
        }
        if let Some(values) = self.values.get(pos) {
            let index = (cycle / 64) as usize;
            let is_last = index + 1 == values.len();
            if let Some(word) = values.get(index) {
                let len = if !is_last { 64 } else { self.cycles % 64 };
                let offset = (len - 1) - (cycle % 64);
                assert!(offset < 64);
                let bit = (word >> offset) & 1;
                Some(bit)
            } else {
                None
            }
        } else {
            None
        }
    }
}

pub fn load_traces(id: String, file_names: &[String]) -> TraceGroup {
    let start_load = Instant::now();
    let files = find_wavedump_files(file_names);
    assert!(
        !files.is_empty(),
        "You need to specify at least one file or directory containing vcds!\nSearched: {:?}\nFound: {:?}",
        file_names,
        files
    );
    println!("Loading {} wavedump files.", files.len());

    // find signal names
    let (signal_names, aliases) = find_all_tracker_signals(&files[0]);

    let signal_to_pos: HashMap<String, usize> = signal_names
        .iter()
        .cloned()
        .enumerate()
        .map(|(i, u)| (u, i))
        .collect();

    assert_eq!(
        signal_names.len(),
        signal_to_pos.len(),
        "It appears that there are duplicate signal names:\n{:?}\n{:?}",
        signal_names,
        signal_to_pos
    );

    // load files in parallel
    let traces: Vec<SignalTrace> = files
        .par_iter()
        .progress_count(files.len() as u64)
        .map(|filename| extract_tracker_signals(filename, &signal_to_pos))
        .collect();
    println!(
        "Loaded {} traces in {:?}",
        traces.len(),
        start_load.elapsed()
    );

    TraceGroup {
        traces,
        signal_names,
        aliases,
        id,
    }
}

fn find_all_tracker_signals(filename: &Path) -> (Vec<String>, Vec<(String, usize)>) {
    let input = fs::File::open(filename).expect("failed to open input file!");
    let mut reader = vcd::Parser::new(input);
    let header = reader.parse_header().expect("failed to parse header");

    // parse header to identify all names
    let tracker = find_tracker(&header);
    let (mut code_to_name, _) = get_all_signals(&tracker.children);

    // we want to create signal groups in a deterministic order
    let mut signal_groups: Vec<_> = code_to_name.values_mut().into_iter().collect();
    signal_groups.iter_mut().for_each(|g| g.sort()); // sort each group
    signal_groups.sort_by_key(|g| g.first().unwrap().to_owned()); // sort by first name in group

    // create a deterministic list of unique signals
    let mut signals: Vec<String> = Vec::new();
    let mut aliases: Vec<(String, usize)> = Vec::new();
    for names in signal_groups.into_iter() {
        let mut included: Vec<_> = names
            .iter()
            .filter(|n| is_not_clock_or_reset(n))
            .map(|s| s.to_owned())
            .collect();
        included.sort();
        let mut included_iter = included.into_iter();
        let pos = signals.len();
        if let Some(name) = included_iter.next() {
            signals.push(name)
        }
        // remember the aliased names
        for ignored in included_iter {
            aliases.push((ignored, pos));
        }
    }

    (signals, aliases)
}

fn is_not_clock_or_reset(n: &str) -> bool {
    !(n == "reset" || n == "clock")
}

fn find_wavedump_files(filenames: &[String]) -> Vec<PathBuf> {
    let mut files = Vec::new();
    for arg in filenames.iter() {
        let path = Path::new(arg);
        assert!(path.exists(), "{} does not exist!", path.display());
        if path.is_file() {
            files.push(path.to_path_buf());
        } else if path.is_dir() {
            find_wavedumps(path, &mut files);
        }
    }
    files.sort(); // make sure that we always get a deterministic order of files
    files
}

fn find_wavedumps(dir: &Path, files: &mut Vec<PathBuf>) {
    let rd = fs::read_dir(dir).unwrap();
    for e in rd.flat_map(Result::ok) {
        let path: PathBuf = e.path();
        if path.is_file() && path.extension().map(|e| e == "vcd").unwrap_or(false) {
            files.push(path);
        }
    }
}

fn get_all_signals(
    items: &[vcd::ScopeItem],
) -> (
    HashMap<vcd::IdCode, Vec<String>>,
    HashMap<String, vcd::IdCode>,
) {
    let mut code_to_name: HashMap<vcd::IdCode, Vec<String>> = HashMap::new();
    let mut name_to_code: HashMap<String, vcd::IdCode> = HashMap::new();
    items.iter().for_each(|i| {
        if let vcd::ScopeItem::Var(s) = i {
            if s.var_type == vcd::VarType::Wire {
                code_to_name
                    .entry(s.code)
                    .or_insert(Vec::new())
                    .push(s.reference.to_owned());
                name_to_code.insert(s.reference.to_owned(), s.code);
            }
        }
    });
    (code_to_name, name_to_code)
}

/// find top level module and tracker instance
fn find_tracker(header: &vcd::Header) -> &vcd::Scope {
    let top = find_scope(&header.items, None);
    let dut = find_scope(&top.children, None);

    find_scope(&dut.children, Some("tracker")) as _
}

/// find the first scope in a slice of scope items
fn find_scope<'a>(items: &'a [vcd::ScopeItem], name: Option<&str>) -> &'a vcd::Scope {
    items
        .iter()
        .find_map(|i| match i {
            vcd::ScopeItem::Scope(s) => match name {
                Some(n) if n == s.identifier => Some(s),
                None => Some(s),
                _ => None,
            },
            _ => None,
        })
        .unwrap_or_else(|| panic!("failed to find a Scope of name {:?} in item list", name))
}

/// find the first variable in a slice of scope items
fn find_wire<'a>(items: &'a [vcd::ScopeItem], name: &str) -> &'a vcd::Var {
    items
        .iter()
        .find_map(|i| match i {
            vcd::ScopeItem::Var(v) if v.reference == name => match v.var_type {
                vcd::VarType::Wire => Some(v),
                _ => None,
            },
            _ => None,
        })
        .unwrap_or_else(|| panic!("failed to find a wire of name {:?} in item list", name))
}

fn find_signal_ids(
    header: &vcd::Header,
    names: &HashMap<String, usize>,
) -> HashMap<vcd::IdCode, usize> {
    let tracker = find_tracker(header);
    let mut code_to_pos = HashMap::new();

    tracker.children.iter().for_each(|i| {
        if let vcd::ScopeItem::Var(v) = i {
            if v.var_type == vcd::VarType::Wire {
                if let Some(pos) = names.get(&v.reference) {
                    // println!("code_to_pos[{}] = {}", v.reference, *pos);
                    code_to_pos.insert(v.code, *pos);
                }
            }
        }
    });

    // debugging code to help us identify the names of missing signals, right before panicing
    if code_to_pos.len() != names.len() {
        let found: HashSet<_> = code_to_pos.values().collect();
        let expected: HashSet<_> = names.values().collect();
        let mut missing: Vec<_> = expected.difference(&found).collect();
        missing.sort();
        for m in missing.iter() {
            let name = names
                .iter()
                .find_map(|(n, p)| if p == **m { Some(n) } else { None })
                .unwrap();
            println!("{}", name);
        }
    }

    assert_eq!(
        code_to_pos.len(),
        names.len(),
        "Did not find the expected amount of tracker signals!"
    );

    code_to_pos
}

fn extract_tracker_signals(filename: &Path, signal_names: &HashMap<String, usize>) -> SignalTrace {
    let input = fs::File::open(filename).expect("failed to open input file!");

    let mut reader = vcd::Parser::new(input);
    let header = reader.parse_header().expect("failed to parse header");

    // find clock and reset in order for us to sample signals correctly
    let top = find_scope(&header.items, None);
    let dut = find_scope(&top.children, None);
    let clock = find_wire(&dut.children, "clock").code;
    let reset = find_wire(&dut.children, "reset").code;

    // filter out tracker signals
    let ids = find_signal_ids(&header, signal_names);

    let cmds = reader.into_iter().filter_map(|s| s.ok());
    let (cycles, values) = extract_values(&ids, Box::new(cmds), clock, reset);

    // derive the name from the filename
    let name = filename.to_str().unwrap().to_string();

    SignalTrace {
        name,
        values,
        cycles,
    }
}

fn extract_values(
    ids: &HashMap<vcd::IdCode, usize>,
    cmds: Box<dyn iter::Iterator<Item = vcd::Command>>,
    clock: vcd::IdCode,
    reset: vcd::IdCode,
) -> (u64, Vec<Vec<u64>>) {
    // create some space to store the results
    let mut values: Vec<Vec<u64>> = (0..ids.len()).map(|_| Vec::new()).collect();

    // collect signal values
    let mut reset_active = true;
    let mut rising_edge_pending = false;
    let mut cycle = 0u64;
    // we use the temp array to store the values from up to 64 cycles before they are pushed
    // to the values vectors
    let mut count = 0u64;
    let mut temp = vec![0u64; ids.len()];

    for cmd in cmds {
        match cmd {
            vcd::Command::ChangeScalar(code, val) => {
                if code == clock {
                    if val == vcd::Value::V1 {
                        rising_edge_pending = true;
                    }
                } else if code == reset {
                    reset_active = val_to_bool(val);
                } else if let Some(index) = ids.get(&code) {
                    let value = val_to_bool(val);
                    if value {
                        // set bit
                        temp[*index] |= 1;
                    } else {
                        // clear bit
                        temp[*index] &= !1;
                    }
                }
            }
            vcd::Command::ChangeVector(code, _) => {
                if ids.get(&code).is_some() {
                    panic!("vector signals are not supported!");
                }
            }
            vcd::Command::Timestamp(_value) => {
                if rising_edge_pending {
                    rising_edge_pending = false;

                    // sample values
                    if !reset_active {
                        cycle += 1; // we only count non-reset cycles
                        count += 1;
                        if count == 64 {
                            count = 0;
                            temp.iter_mut()
                                .zip(values.iter_mut())
                                .for_each(|(tmp, val)| {
                                    val.push(*tmp);
                                    let was_one = (*tmp) & 1 == 1;
                                    if was_one {
                                        *tmp = 1;
                                    } else {
                                        *tmp = 0;
                                    }
                                })
                        } else {
                            temp.iter_mut().for_each(|tmp| {
                                let was_one = (*tmp) & 1 == 1;
                                if was_one {
                                    *tmp = (*tmp << 1) | 1;
                                } else {
                                    *tmp <<= 1;
                                }
                            })
                        }
                    }
                }
            }
            _ => (),
        }
    }

    if count > 0 {
        temp.iter().zip(values.iter_mut()).for_each(|(tmp, val)| {
            // we never finished the last sampling, so we have to remove the lsb
            val.push(*tmp >> 1);
        })
    }

    (cycle, values)
}

fn val_to_bool(val: vcd::Value) -> bool {
    matches!(val, vcd::Value::V1)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::{load_traces, SignalTrace, TraceGroup};

    #[test]
    fn load_longer_vcd_into_trace() {
        let filenames = vec!["wavedumps/tests/test0.vcd".to_string()];
        let tg = load_traces("test".to_string(), &filenames);
        assert_eq!(tg.id, "test".to_string());
        assert_eq!(tg.traces.len(), 1);
        let trace = tg.traces.first().expect("should have one trace");
        assert_eq!(trace.cycles, 249);
        assert_eq!(trace.name, "wavedumps/tests/test0.vcd");

        // check values of dut__core__dpath__alu__out_t_10_0
        let pos = tg.find_signal("dut__core__dpath__alu___out_T_10_0");

        let signal_values = &trace.values[pos];

        assert_eq!(trace.get(0, pos), Some(0));
        assert_eq!(trace.get(1, pos), Some(0));
        assert_eq!(trace.get(2, pos), Some(0));
        assert_eq!(trace.get(3, pos), Some(0));
        assert_eq!(trace.get(4, pos), Some(0));
        assert_eq!(trace.get(5, pos), Some(1));

        // at the end of the trace, we expect 41 zeros before the first 1
        for i in 0..41 {
            assert_eq!(trace.get(248 - i, pos), Some(0));
        }
        assert_eq!(trace.get(248 - 41, pos), Some(1));
        // after that we are back to zero
        assert_eq!(trace.get(248 - 42, pos), Some(0));
        assert_eq!(trace.get(248 - 43, pos), Some(0));
        assert_eq!(trace.get(248 - 44, pos), Some(1));
        assert_eq!(trace.get(248 - 45, pos), Some(1));
    }

    #[test]
    fn correctly_parse_vcd() {
        // wavedumps/riscv-mini/fuzzing-250/id:000649,src:000639,time:9971492,execs:1640942,op:havoc,rep:2.vcd
        // the following signal seems to be parsed incorrectly: dut__core__dpath___stall_T_1_0
        // the problem was that tmp was reset to 0 instead of 1 in extract_values
        let filenames = vec!["wavedumps/tests/test1.vcd".to_string()];
        let expected = "000000000000000000111100000000000011110000000001111000000000111100000000011110000000001111000000000111100000000011110000000001111111100000000011111111000000000111111110000000001111111100000000011111111000000000111111110000000001111111100000000011111";

        let trace = extract_tracker_signals(
            &Path::new(&filenames[0]),
            &HashMap::from([("dut__core__dpath___stall_T_1_0".to_string(), 0)]),
        );

        let pos = 0;
        for (cycle, expected) in expected.chars().enumerate() {
            let actual = trace.get(cycle as u64, pos).unwrap();
            match expected {
                '1' => assert_eq!(actual, 1, "expected 1 in cycle {}", cycle),
                '0' => assert_eq!(actual, 0, "expected 0 in cycle {}", cycle),
                _ => panic!(),
            }
        }
    }
}
