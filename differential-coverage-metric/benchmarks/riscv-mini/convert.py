#!/usr/bin/env python3
import argparse, sys, os, re

def parse():
  parser = argparse.ArgumentParser(description='Convert risc-v mini traces generated by sby to binary inputs comparable to what is produced by the fuzzer.')
  parser.add_argument('input', help='input testbench verilog from symbiyosys', required=True)
  args = parser.parse_args()
  return args.input

_mem_re = re.compile(r"_mem\[\d+'b([01]+)\] = \d+'b([01]+)")

def find_mem_init(filename) -> dict:
  res = {}
  with open(filename) as ff:
    for line in ff.readlines():
      m = _mem_re.search(line)
      if m is not None:
        addr = int(m.group(1), 2)
        data = int(m.group(2), 2)
        res[addr] = data
  return res

def sparse_mem_to_bin(mem: dict):
  # the simulated memory has 64-bit, i.e. 8-byte data entries
  max_addr = max(mem.keys()) * 8 # max addr in bytes
  # start with all zeros
  out = b'\00' * (max_addr + 8)
  # write to addresses that have non zero values
  for addr, value in mem.items():
    addr = addr * 8
    bbs = value.to_bytes(8, byteorder='little')
    out = out[:addr] + bbs + out[addr+len(bbs):]
  return out

def main():
  filename = parse()
  assert os.path.isfile(filename)
  mem = find_mem_init(filename)
  bbs = sparse_mem_to_bin(mem)
  sys.stdout.write(bbs)

if __name__ == "__main__":
  main()
