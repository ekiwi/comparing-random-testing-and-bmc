#!/usr/bin/env bash

# generate C++ model
verilator -O1 -Wno-fatal -Wno-WIDTH -Wno-STMTDLY  --prefix Vtop --Mdir verilated -cc -exe TileAndMemTop.sv SignalTracker.sv verilator_conf.vlt top.cpp lib/afl.c --coverage-user -FI ../lib/afl.h -CFLAGS "-DIGNORE_COV"

# instead of verilator counting coverage, we will increment AFL counters
./instrument_afl_cover.py verilated/

# compile
make -C verilated/ -j -f Vtop.mk Vtop

# fuzz
rm -r out
AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1 AFL_SKIP_CPUFREQ=1 ~/d/AFLplusplus/afl-fuzz -i seeds -o out ./verilated/Vtop
