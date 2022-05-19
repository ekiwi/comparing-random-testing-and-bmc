#!/usr/bin/env python3

import argparse, re
from pathlib import Path


def parse():
  parser = argparse.ArgumentParser(description='Instrument Verilator generated C++ to make cover points work with AFL')
  parser.add_argument('input', help='Verilator generated folder')
  args = parser.parse_args()
  return Path(args.input)

def find_input_files(inp: Path):
  assert inp.is_dir(), f"{inp} not found or not a directory!"
  r = []
  for ff in inp.iterdir():
    if ff.is_file() and ff.suffix.lower() in ['.cpp', '.h']:
      r.append(ff)
  return r

_re_cov = re.compile(r'\+\+\(vlSymsp->__Vcoverage\[(\d+)\]\)')
_cov_sub = r'afl_increment(\1)'

def is_line_cov_insert(line: str) -> bool:
  trimmed = line.strip()
  return trimmed.startswith("__vlCoverInsert(") and trimmed.endswith(");")

def patch_file(filename: Path):
  changed = False
  res = []
  with open(filename) as f:
    for line in f.readlines():
      r = _re_cov.sub(_cov_sub, line)
      is_cov_insert = is_line_cov_insert(line)
      if not changed and r != line or is_cov_insert:
        changed = True
      if not is_cov_insert:
        res.append(r)
  if changed:
    with open(filename, 'w') as f:
      f.writelines(res)
    print(f"patched {filename}")

def main():
  inp = parse()
  input_files = find_input_files(inp)
  for ff in input_files:
    patch_file(ff)


if __name__ == "__main__":
  main()
