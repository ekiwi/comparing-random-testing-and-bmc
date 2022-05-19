#!/usr/bin/env python3
import argparse, shutil, os, subprocess, stat
from pathlib import Path
from benchmark import load_benchmark, Benchmark, make_empty_signal_tracker

_script_dir = Path( __file__ ).parent.resolve()

def parse():
  parser = argparse.ArgumentParser(description='Starts a fuzzing run in the specified directory')
  parser.add_argument('--benchmark', help='benchmark json file', required=True)
  parser.add_argument('directory', help='empty directory to place the fuzzing files in')
  parser.add_argument('--timeout', help='maximum number of hours to fuzz for')
  parser.add_argument('--overwrite', help='overwrite the output directory', action='store_true')
  parser.add_argument('--afl', help='afl directory', required=True)

  args = parser.parse_args()
  return (
    load_benchmark(args.benchmark),
    Path(args.directory),
    Path(args.afl).resolve(),
    args.overwrite,
    args.timeout
  )

def check_afl(directory: Path):
  assert directory.is_dir(), f"Could not find AFL directory: {directory}"
  assert (directory / "afl-clang-fast++").is_file(), f"Could not find afl-clang-fast++ in: {directory}"



def make_fuzz_dir(benchmark: Benchmark, directory: Path, overwrite: bool):
  if overwrite and directory.exists():
    shutil.rmtree(directory)
  assert not directory.exists(), f"directory {directory} already exists, please remove it and try again"
  directory.mkdir()
  # copy over testbench and verilog files
  for vv in benchmark.verilog + benchmark.testbench:
    shutil.copy(src=vv, dst=directory)
  # create an empty signal tracker
  make_empty_signal_tracker(benchmark, directory)
  # copy over Makefile
  shutil.copy(src=(_script_dir / "Makefile"), dst=directory)
  # copy over seeds
  seed_dir = directory / "seeds"
  seed_dir.mkdir()
  for ff in benchmark.seeds:
    shutil.copy(src=ff, dst=seed_dir)

_verilator_flags = [
  '-O1', '-Wno-fatal', '-Wno-WIDTH', '-Wno-STMTDLY', '--prefix', 'Vtop', '--Mdir', 'verilated',
  '-cc', '-exe',
]

def make_fuzz_binary(benchmark: Benchmark, directory: Path, afl_dir: Path):
  # convert to C++ model
  files = [os.path.basename(ff) for ff in benchmark.verilog + benchmark.testbench] + ["SignalTracker.sv"]
  cmd = ["verilator"] + _verilator_flags + files
  print(" ".join(cmd))
  subprocess.run(cmd, cwd=directory, check=True)
  make_cmd = ["make", f"MK_AFL_DIR={afl_dir.resolve()}"]

  # compile + instrument
  print(" ".join(make_cmd))
  subprocess.run(make_cmd, cwd=directory, check=True)

  # make fuzz command
  fuzz_sh = directory / "fuzz.sh"
  with open(fuzz_sh, "w") as ff:
    ff.write(_fuzz_sh.format(AFL_DIR=afl_dir.resolve()))
  fuzz_sh.chmod(fuzz_sh.stat().st_mode | stat.S_IEXEC)


_fuzz_sh = """
#!/usr/bin/env bash
rm -r out
AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1 AFL_SKIP_CPUFREQ=1 {AFL_DIR}/afl-fuzz -i seeds -o out ./verilated/Vtop
"""

def main():
  benchmark, directory, afl, overwrite, timeout = parse()
  check_afl(afl)
  print(benchmark.name, len(benchmark.signals), len(benchmark.seeds))
  make_fuzz_dir(benchmark, directory, overwrite)
  make_fuzz_binary(benchmark, directory, afl)

if __name__ == "__main__":
  main()


