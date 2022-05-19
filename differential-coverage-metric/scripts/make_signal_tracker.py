#!/usr/bin/env python3
import argparse, shutil, os, subprocess, stat
from pathlib import Path
from benchmark import load_benchmark, Benchmark, make_empty_signal_tracker

_script_dir = Path( __file__ ).parent.resolve()

def parse():
  parser = argparse.ArgumentParser(description='Prints out a SignalTracker module for a given benchmark.')
  parser.add_argument('--benchmark', help='benchmark json file', required=True)
  parser.add_argument('--cover-toggle', help='adds', action='store_true')

  args = parser.parse_args()
  return (
    load_benchmark(args.benchmark),
    args.cover_toggle
  )

def make_signal_tracker(benchmark: Benchmark, cover_toggle: bool) -> str:
  out = "module SignalTracker(\n"
  sigs = ["clock", "reset"] + [s.name for s in benchmark.signals]
  inputs = ["  input " + s for s in sigs]
  out += ",\n".join(inputs)
  out += "\n);\n"
  if cover_toggle:
    out += "  always @(posedge clock) begin\n"
    out += "    if (~reset) begin\n"
    for s in benchmark.signals:
      out += f"      cover({s.name});\n"
      out += f"      cover(~{s.name});\n"
    out += "    end\n"
    out += "  end\n"
  out += "endmodule\n"

  return out

def main():
  benchmark, cover_toggle = parse()
  print(make_signal_tracker(benchmark, cover_toggle))

if __name__ == "__main__":
  main()