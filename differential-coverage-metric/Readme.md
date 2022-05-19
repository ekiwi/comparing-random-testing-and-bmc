# Differential Coverage Metric

The `riscv-mini` benchmark is available in the `benchmarks`
directory.

## Instrumentation

To build the JAR, run `sbt assembly` in the `instrumentation` folder.

The you can instrument the `riscv-mini` benchmark like:

```
./instrumentation/utils/bin/firrtl \
  -i benchmarks/riscv-mini/TileAndMemTop.fir \
  -faf benchmarks/riscv-mini/TileAndMemTop.anno.json \
  -td benchmarks/riscv-mini/instrumented \
  -E sverilog --mux-control-coverage --line-coverage \
  --compare-coverage --expose-cover-signals --init-to-zero \
  --drive-reset --do-not-init TileAndMemTop:TileAndMemTop:_mem \
  --do-not-cover TileAndMemTop:TileAndMemTop -ll info
```

## BMC

To run our BMC flow as described in the paper, you need the tools from
https://github.com/YosysHQ/oss-cad-suite-build.
You can generate the initial invariants in the `miner` folder like this:
```
cargo run --release -- mine --signal-info=../benchmarks/riscv-mini/instrumented/TileAndMemTop.inst.json --output=toggle.sv --max-holes=1
```

This will create a `toggle.sv` file with the cover points. Using that and the instrumented
version of RSIC-V Mini we can run the model checker.
See `data/2022-05-17-cov-toggle/` for our experiments.

You can use the `scripts/convert_traces.py` script to convert the output of the model checker
to a binary in the same format as the fuzzer produces.
You can then use the scripts in `cov-analysis` to convert the inputs to VCD wave traces that the miner can consume.

To mine on the generated traces, you can use the following commands in the `miner` directory:

```
cargo run --release -- extract --id=formal-toggel wavedumps
cargo run --release -- mine --signal-info=../benchmarks/riscv-mini/instrumented/TileAndMemTop.inst.json --output=toggle.sv --max-holes=2 formal-toggle.json
```

The results of our other formal runs can be found in:
- `data/2022-05-17-cov-full`
- `data/2022-05-17-cov-full-2`
- `data/2022-05-17-cov-full-3`


## Fuzzing

To use the fuzzer you need to clone and compile the AFL++ fuzzer: https://github.com/AFLplusplus/AFLplusplus

The you can generate all the fuzzer files in a folder named `fuzz` like:
```
./scripts/fuzz.py --benchmark benchmarks/riscv-mini/RiscvMini.json --afl=../../AFLplusplus/ fuzz
``` 

To run the fuzzer, in the `fuzz` directory execute:
```
timeout 24h afl-fuzz -i seeds -o out ./verilated/Vtop
```

Our fuzzing results can be found in `data/2022-05-16-riscv-mini-24h-fuzzing/`
