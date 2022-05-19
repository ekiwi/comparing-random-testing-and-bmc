#!/usr/bin/env python3
import utils, sys

depth = [1,2,3,4,5,6,7,8,9,10,11,12]
seeds = 10
cycles = 10000
restarts = 1
timeout = 15 * 60 # 15min
harness = "universal" # harness does not matter for deepbug

if __name__ == "__main__":
    tpe = "" if len(sys.argv) < 2 else sys.argv[1]
    assert tpe in {"bmc", "random", ""}
    for r in depth:
      design = f"deepbug:depth={r}:withBug=true"
      if tpe != "bmc":
        utils.run_random(design, harness, seeds, cycles, restarts)
      if tpe != "random":
        utils.run_bmc(design, harness, timeout)