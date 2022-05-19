#!/usr/bin/env python3
import utils, math, sys

def is_pow_2(i):
  if i < 1: return False
  return (1 << int(math.log2(i))) == i

depths = [d+1 for d in range(1 << 12) if is_pow_2(d + 1) and d > 2]
seeds = 10
cycles = 10000
restarts = 1
timeout = 15 * 60 # 15min
with_bug=True
widths=[8,64]

print(f"{depths=}")
print(f"{seeds=}, {cycles=}, {restarts=}, {timeout=}s")

if __name__ == "__main__":
  tpe = "" if len(sys.argv) < 2 else sys.argv[1]
  assert tpe in {"bmc", "random", ""}
  for r in depths:
    for width in widths:
      design = f"circular-fifo:depth={r}:width={width}:withBug={with_bug}"
      if tpe != "bmc":
        for harness in ["software", "universal"]:
          utils.run_random(design, harness, seeds, cycles, restarts)
      if tpe != "random":
        for harness in ["formal", "universal"]:
          utils.run_bmc(design, harness, timeout)
