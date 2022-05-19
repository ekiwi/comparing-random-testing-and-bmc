# Solving Rfuzz Benchmarks with a Bounded Model Checker


## Benchmark Generation

_Note_: all benchmark harness have been created by us and are part of this
repository.

There is some manual work needed to get a bounded model
checker to solve a given rfuzz benchmark.
We document some steps for the `Sodor1Stage` benchmark:

- generate the instrumented design and end2end evaluation binary:
  `make FIR=Sodor1Stage.fir DUT=Sodor1Stage bin`
- copy over the instrumented Verilog from the build folder:
  `cp ../../build/Sodor1Stage.v .`
- create a harness that instanciates the design and
  contains cover statements for all cover points
  see `Sodor1Stage_formal.sv` as an example.
  You can also often copy some code from the fuzz harness,
  e.g., `Sodor1Stage_VHarness.v`.
- create a SymbiYosys job file:
```.sby
[options]
mode cover
depth 100

[engines]
smtbmc boolector

[script]
read -formal Sodor1Stage.v
read -formal Sodor1Stage_formal.sv
prep -top Sodor1StageTop

[files]
Sodor1Stage.v
Sodor1Stage_formal.sv
```
- try running `sby cover.sby`
- you might have to remove calls to `$fwrite` or `$fatal`

## Generate Inputs

_Note_: our results from running the BMC can be found in the `results` folder.

- run `sby cover.sby`
- use the `convert_traces.py` script to convert the model checker output
  to the JSON format used by the fuzzer
- we also need to manually add a `last.json` and `config.json` file to
  the results, `latest.json` is the same for all benchmarks, `config.json`
  has to be copied from results on the same design


## Generate Plots

see the rfuzz documentation: https://github.com/ekiwi/rfuzz/#analysis
