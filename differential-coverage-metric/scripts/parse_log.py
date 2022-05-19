#!/usr/bin/env python3
import argparse, tqdm, shutil, os, glob, re
from pathlib import Path


def parse():
  parser = argparse.ArgumentParser(description='Parses the sby log file.')
  parser.add_argument('logfile', help='logfile.txt from sby')
  parser.add_argument('--source', help='source verilog file for better coverage names')

  args = parser.parse_args()
  return Path(args.logfile), args.source


_re_reached = re.compile(r"Reached cover statement at ([^:]+):(\d+)\.\d+\-(\d+)\.\d+")
_re_step = re.compile(r"in step (\d+)")
_re_unreached = re.compile(r"Unreached cover statement at ([^:]+):(\d+)\.\d+\-(\d+)\.\d+")

def parse_log(logfile, source):
  exprs = cover_names_from_source(source)
  reached = []
  unreached = []
  with open(logfile) as ff:
    for line in ff.readlines():
      rr = _re_reached.search(line)
      uu = _re_unreached.search(line)
      if rr is not None:
        ff, start, end = rr.groups()
        step = _re_step.search(line).group(1)
        reached.append(parse_name(ff, start, end, exprs) + " @ " + step)
      if uu is not None:
        ff, start, end = uu.groups()
        unreached.append(parse_name(ff, start, end, exprs))
  total = len(reached) + len(unreached)
  print(f"Not covered ({len(unreached)} / {total}):")
  print('\n'.join(unreached))

def parse_name(ff, start, end, exprs) -> str:
  start, end = int(start), int(end)
  name = f"{ff}:{start}-{end}"
  if start in exprs:
    name = exprs[start]
  if end in exprs:
    name = exprs[end]
  return name

_cover_start = "cover("
_cover_end = ");"

def cover_names_from_source(source):
  if source is None: return {}
  assert os.path.isfile(source), source
  mapping = {}
  with open(source) as ff:
    for ii, line in enumerate(ff.readlines()):
      line = line.strip()
      if line.startswith(_cover_start) and line.endswith(_cover_end):
        expr = line[len(_cover_start) : -len(_cover_end)].strip()
        mapping[ii+1] = expr
  return mapping

def main():
  logfile, source = parse()
  parse_log(logfile, source)

if __name__ == "__main__":
  main()
