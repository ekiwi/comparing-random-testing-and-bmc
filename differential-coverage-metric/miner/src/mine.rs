use crate::{SignalTrace, TraceGroup};
use std::collections::{HashMap, HashSet};
use std::hash::Hash;
use std::time::Instant;

/// a property that can be mined
#[derive(Debug, PartialEq, Eq, Hash, Copy, Clone, PartialOrd, Ord)]
pub enum Prop {
    True(usize),
    False(usize),
    Equal(usize, usize),
    Implies(usize, usize),
    NotImplies(usize, usize),
    Or(usize, usize),
}

#[derive(Debug, PartialEq, Eq, Hash, Copy, Clone)]
pub enum TemplateSize {
    One,
    Two,
    Three,
}

pub struct SignalFilters {
    pub include_stuck_signals: bool,
    pub user_exclude_signals: Vec<String>,
    pub include_signals: Vec<String>,
}

pub fn prop_to_human_readable(
    prop: &Prop,
    names: &[String],
    signal_info: &HashMap<String, String>,
) -> String {
    match prop {
        Prop::True(a) => var_to_string(*a, names, signal_info),
        Prop::False(a) => format!("not({})", var_to_string(*a, names, signal_info)),
        Prop::Equal(a, b) => format!(
            "{} == {}",
            var_to_string(*a, names, signal_info),
            var_to_string(*b, names, signal_info)
        ),
        Prop::Implies(a, b) => format!(
            "{} |-> {}",
            var_to_string(*a, names, signal_info),
            var_to_string(*b, names, signal_info)
        ),
        Prop::NotImplies(a, b) => format!(
            "not({} |-> {})",
            var_to_string(*a, names, signal_info),
            var_to_string(*b, names, signal_info)
        ),
        Prop::Or(a, b) => format!(
            "{} || {}",
            var_to_string(*a, names, signal_info),
            var_to_string(*b, names, signal_info)
        ),
    }
}

fn var_to_string(pos: usize, names: &[String], signal_info: &HashMap<String, String>) -> String {
    let name = &names[pos];
    match signal_info.get(name) {
        Some(n) => n.clone(),
        None => name.clone(),
    }
}

pub fn prop_to_verilog(prop: &Prop, names: &[String]) -> String {
    match prop {
        Prop::True(a) => names[*a].clone(),
        Prop::False(a) => format!("~{}", names[*a]),
        Prop::Equal(a, b) => format!("{} == {}", names[*a], names[*b]),
        Prop::Implies(a, b) => format!("(~{}) | {}", names[*a], names[*b]),
        Prop::NotImplies(a, b) => format!("{} & (~{})", names[*a], names[*b]),
        Prop::Or(a, b) => format!("{} | {}", names[*a], names[*b]),
    }
}

fn check_true(a: u64) -> u64 {
    a
}
fn check_false(a: u64) -> u64 {
    !a
}
fn check_equal(a: u64, b: u64) -> u64 {
    !(a ^ b)
}
fn check_implies(a: u64, b: u64) -> u64 {
    (!a) | b
}
fn check_not_implies(a: u64, b: u64) -> u64 {
    a & (!b)
}
fn check_or(a: u64, b: u64) -> u64 {
    a | b
}

pub fn do_mine(
    trace_group: &TraceGroup,
    filters: &SignalFilters,
    max_holes: TemplateSize,
) -> Vec<Prop> {
    let signal_ids = filter_traces(
        trace_group,
        &filters.user_exclude_signals,
        &filters.include_signals,
    );

    // keep track of properties that hold
    let mut props: Vec<Prop> = Vec::new();

    let start = Instant::now();
    let all_signals: Vec<_> = signal_ids;
    // first we try to find all signals that are true at some point but not always true
    let non_stuck = identify_non_stuck(
        &trace_group.signal_names,
        &trace_group.traces,
        &all_signals,
        &mut props,
    );

    let signals = if filters.include_stuck_signals {
        all_signals
    } else {
        non_stuck
    };

    // return if we are only supposed to check patterns with a single hole
    if max_holes == TemplateSize::One {
        return props;
    }

    // now we mine some 2 signal patterns
    let equals = mine_2("equals", &check_equal, true, &signals, &trace_group.traces);
    props.extend(equals.iter().map(|(a, b)| Prop::Equal(*a, *b)));
    identify_equality_groups(&trace_group.signal_names, &equals);

    let implications = mine_2(
        "implications",
        &check_implies,
        false,
        &signals,
        &trace_group.traces,
    );
    props.extend(implications.iter().map(|(a, b)| Prop::Implies(*a, *b)));

    let not_implications = mine_2(
        "not implications",
        &check_not_implies,
        false,
        &signals,
        &trace_group.traces,
    );
    props.extend(
        not_implications
            .iter()
            .map(|(a, b)| Prop::NotImplies(*a, *b)),
    );

    let disjunctions = mine_2(
        "disjunctions",
        &check_or,
        true,
        &signals,
        &trace_group.traces,
    );
    props.extend(disjunctions.iter().map(|(a, b)| Prop::Or(*a, *b)));

    println!("All mining took {:?}", start.elapsed());
    props
}

// tries finds _a_ violating
#[derive(Debug, PartialEq, Eq)]
pub struct PropViolation {
    pub trace: String,
    pub cycle: u64,
}
pub fn find_violating_trace(prop: &Prop, tgs: &TraceGroup) -> Option<PropViolation> {
    for trace in tgs.traces.iter() {
        if let PropRes::Falsified(cycle) = does_prop_hold(prop, trace) {
            return Some(PropViolation {
                trace: trace.name.clone(),
                cycle,
            });
        }
    }
    None
}

#[derive(Debug, PartialEq, Eq)]
enum PropRes {
    Holds,
    Falsified(u64),
}

fn does_prop_hold(prop: &Prop, trace: &SignalTrace) -> PropRes {
    for ii in 0..trace.cycles {
        if !does_prop_hold_in_cycle(prop, trace, ii) {
            return PropRes::Falsified(ii);
        }
    }
    PropRes::Holds
}

fn does_prop_hold_in_cycle(prop: &Prop, trace: &SignalTrace, cycle: u64) -> bool {
    match prop {
        Prop::True(a) => check_true(trace.get(cycle, *a).unwrap()) & 1 == 1,
        Prop::False(a) => check_false(trace.get(cycle, *a).unwrap()) & 1 == 1,
        Prop::Equal(a, b) => {
            check_equal(trace.get(cycle, *a).unwrap(), trace.get(cycle, *b).unwrap()) & 1 == 1
        }
        Prop::Implies(a, b) => {
            check_implies(trace.get(cycle, *a).unwrap(), trace.get(cycle, *b).unwrap()) & 1 == 1
        }
        Prop::NotImplies(a, b) => {
            check_not_implies(trace.get(cycle, *a).unwrap(), trace.get(cycle, *b).unwrap()) & 1 == 1
        }
        Prop::Or(a, b) => {
            check_or(trace.get(cycle, *a).unwrap(), trace.get(cycle, *b).unwrap()) & 1 == 1
        }
    }
}

/// identifies the correct indices to use in the trace group
fn filter_traces(
    tgs: &TraceGroup,
    exclude_signals: &[String],
    include_signals: &[String],
) -> Vec<usize> {
    let mut name_to_pos = HashMap::new();
    let mut pos_to_name = HashMap::new();
    for (pos, name) in tgs
        .signal_names
        .iter()
        .enumerate()
        .chain(tgs.aliases.iter().map(|(n, p)| (*p, n)))
    {
        name_to_pos.insert(name, pos);
        pos_to_name.entry(pos).or_insert(Vec::new()).push(name);
    }

    // if there is an include list, make sure all signals on it are available
    for signal in include_signals {
        assert!(
            name_to_pos.contains_key(signal),
            "Failed to find include signal {}",
            signal
        );
    }

    let signal_names: Vec<&String> = if !include_signals.is_empty() {
        // after this check, if we only care about included signals, we can just return them
        include_signals.iter().map(|s| s as &String).collect()
    } else {
        let mut duplicates = Vec::new();
        // otherwise we need to ensure that we create a deterministic list of signals and
        // exclude any signals requested by the user
        let is_exclude: HashSet<&String> = HashSet::from_iter(exclude_signals.iter());
        let mut signals: Vec<&String> = Vec::new();
        for names in pos_to_name.into_values() {
            let mut included: Vec<_> = names
                .into_iter()
                .filter(|n| !is_exclude.contains(n))
                .collect();
            included.sort();
            let mut included_iter = included.into_iter();
            if let Some(name) = included_iter.next() {
                signals.push(name)
            }
            // print out the names of any signals that map to the same code as others
            for ignored in included_iter {
                duplicates.push(ignored);
            }
        }
        if !duplicates.is_empty() {
            println!(
                "{} signals were redundant in the VCD: {:?}",
                duplicates.len(),
                duplicates
            );
        }
        println!("{} unqiue signals found in the VCD.", signals.len());
        signals
    };
    let mut signals: Vec<_> = signal_names.iter().map(|n| name_to_pos[n]).collect();
    signals.sort_unstable();
    signals.dedup();
    signals
}

fn identify_non_stuck(
    signal_names: &[String],
    traces: &[SignalTrace],
    all_signals: &[usize],
    props: &mut Vec<Prop>,
) -> Vec<usize> {
    let non_stuck: Vec<usize> = all_signals
        .iter()
        .filter(|pos| !always_false(**pos, traces) && !always_true(**pos, traces))
        .cloned()
        .collect();
    // return immediately if non of the signals are stuck
    if non_stuck.len() == all_signals.len() {
        return non_stuck;
    }

    let is_always_true: Vec<_> = all_signals
        .iter()
        .filter(|pos| always_true(**pos, traces))
        .collect();

    let always_true_names: Vec<_> = is_always_true.iter().map(|i| &signal_names[**i]).collect();
    println!(
        "{} / {} signals are always true: {:?}",
        is_always_true.len(),
        signal_names.len(),
        always_true_names,
    );

    let is_always_false: Vec<_> = all_signals
        .iter()
        .filter(|pos| always_false(**pos, traces))
        .collect();
    let always_false_names: Vec<_> = is_always_false.iter().map(|i| &signal_names[**i]).collect();
    println!(
        "{} / {} signals are always false: {:?}",
        is_always_false.len(),
        signal_names.len(),
        always_false_names,
    );

    for ii in is_always_true {
        props.push(Prop::True(*ii))
    }
    for ii in is_always_false {
        props.push(Prop::False(*ii))
    }

    println!(
        "Identified {}/{} signals as not being stuck at a constant value.",
        non_stuck.len(),
        signal_names.len()
    );

    non_stuck
}

fn identify_equality_groups(signal_names: &[String], equals: &[(usize, usize)]) {
    let groups = find_eq_groups(equals);
    if !groups.is_empty() {
        println!("Found the following equivalent signals (for the given traces):");
        for g in groups {
            let names: Vec<_> = g.into_iter().map(|i| &signal_names[i]).collect();
            println!("{:?}", names)
        }
    }
}

fn find_eq_groups(equals: &[(usize, usize)]) -> Vec<Vec<usize>> {
    let mut groups: Vec<Vec<usize>> = Vec::new();
    let mut to_group: HashMap<usize, usize> = HashMap::new();
    for (a, b) in equals {
        if let Some(group_index) = to_group.get(a).cloned() {
            if !to_group.contains_key(b) {
                groups[group_index].push(*b);
                to_group.insert(*b, group_index);
            }
        } else if let Some(group_index) = to_group.get(b).cloned() {
            groups[group_index].push(*a);
            to_group.insert(*a, group_index);
        } else {
            let index = groups.len();
            groups.push(vec![*a, *b]);
            to_group.insert(*a, index);
            to_group.insert(*b, index);
        }
    }
    groups
}

fn mine_2<F>(
    name: &str,
    prop: &F,
    is_commutative: bool,
    signals: &[usize],
    traces: &[SignalTrace],
) -> Vec<(usize, usize)>
where
    F: Fn(u64, u64) -> u64,
{
    let start = Instant::now();

    let max_props = if signals.is_empty() {
        0
    } else if is_commutative {
        signals.len() * (signals.len() - 1) / 2
    } else {
        signals.len() * (signals.len() - 1)
    };

    let holding: Vec<_> = if is_commutative {
        let combs = signals
            .iter()
            .enumerate()
            .flat_map(|(ii, a)| signals.iter().skip(ii + 1).map(|b| (*a, *b)));
        combs
            .filter(|(ant, con)| check_always_2(prop, traces, *ant, *con))
            .collect()
    } else {
        let combs = signals
            .iter()
            .flat_map(|a| signals.iter().filter(|b| *a != **b).map(|b| (*a, *b)));
        combs
            .filter(|(ant, con)| check_always_2(prop, traces, *ant, *con))
            .collect()
    };

    println!("mined {} in {:?}", name, start.elapsed());
    println!("{} / {} {} hold", holding.len(), max_props, name);
    holding
}

#[inline(always)]
fn check_always_2<F>(prop: &F, traces: &[SignalTrace], a: usize, b: usize) -> bool
where
    F: Fn(u64, u64) -> u64,
{
    traces.iter().all(|t| {
        let avs = &t.values[a];
        let bvs = &t.values[b];
        let last_i = avs.len() - 1;
        let last_mask = get_cycle_end_mask(t.cycles);
        avs.iter()
            .zip(bvs.iter())
            .enumerate()
            .all(|(ii, (aa, bb))| {
                let mask = if ii == last_i { last_mask } else { u64::MAX };
                let r: u64 = prop(*aa, *bb);
                (r & mask) == mask
            })
    })
}

#[inline(always)]
fn check_always_1<F>(prop: F, cycles: u64, avs: &[u64]) -> bool
where
    F: Fn(u64) -> u64,
{
    let last_i = avs.len() - 1;
    let last_mask = get_cycle_end_mask(cycles);
    avs.iter().enumerate().all(|(ii, aa)| {
        let mask = if ii == last_i { last_mask } else { u64::MAX };
        let r: u64 = prop(*aa);
        (r & mask) == mask
    })
}

fn always_false(signal: usize, traces: &[SignalTrace]) -> bool {
    let any_true = traces
        .iter()
        .any(|t| t.values[signal].iter().any(|v| *v != 0));
    !any_true
}

fn always_true(signal: usize, traces: &[SignalTrace]) -> bool {
    for trace in traces {
        let values = &trace.values[signal];
        let is_always_true = check_always_1(|a| a, trace.cycles, values);
        if !is_always_true {
            return false;
        }
    }
    true
}

fn get_cycle_end_mask(cycles: u64) -> u64 {
    let bits = cycles % 64;
    if bits == 0 {
        u64::MAX
    } else {
        (1u64 << bits) - 1
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::{load_traces, TraceGroup};

    #[test]
    fn find_violating_trace_test() {
        let filenames = vec!["wavedumps/tests/test0.vcd".to_string()];
        let tg = load_traces("test".to_string(), &filenames);
        let trace = tg.traces.first().expect("should have one trace");

        let a = tg.find_signal("dut__core__dpath__alu___out_T_10_0");

        // the signal is zero in the beginning and becomes 1 after 5 cycles
        let trace = "wavedumps/tests/test0.vcd".to_string();
        assert_eq!(
            find_violating_trace(&Prop::True(a), &tg),
            Some(PropViolation {
                trace: trace.clone(),
                cycle: 0
            })
        );
        assert_eq!(
            find_violating_trace(&Prop::False(a), &tg),
            Some(PropViolation {
                trace: trace.clone(),
                cycle: 5
            })
        );

        let b = tg.find_signal("dut__core__dpath__alu___out_T_7_0");
        assert_eq!(
            find_violating_trace(&Prop::Or(a, b), &tg),
            Some(PropViolation {
                trace: trace.clone(),
                cycle: 20
            })
        );
    }

    fn print_signal_trace(trace: &SignalTrace, pos: usize) {
        for cycle in 0..trace.cycles {
            print!("{}", trace.get(cycle, pos).unwrap());
        }
        println!();
    }

    #[test]
    fn do_not_find_false_implication_violation_test() {
        // wavedumps/riscv-mini/fuzzing-250/id:000649,src:000639,time:9971492,execs:1640942,op:havoc,rep:2.vcd
        let filenames = vec!["wavedumps/tests/test1.vcd".to_string()];
        let tg = load_traces("test".to_string(), &filenames);
        let trace = tg.traces.first().expect("should have one trace");

        let a = tg.find_signal("dut__arb__io_dcache_ar_valid_0");
        let b = tg.find_signal("dut__core__dpath___stall_T_1_0");

        assert_eq!(find_violating_trace(&Prop::Implies(a, b), &tg), None);
    }
}
