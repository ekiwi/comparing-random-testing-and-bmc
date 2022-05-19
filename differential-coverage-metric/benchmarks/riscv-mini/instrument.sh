#!/usr/bin/env bash
../../instrumentation/utils/bin/firrtl \
  -i TileAndMemTop.fir \
  -faf TileAndMemTop.anno.json \
  -td instrumented \
  -E sverilog \
  --mux-control-coverage \
  --compare-coverage \
  --expose-cover-signals \
  --init-to-zero \
  --drive-reset \
  --do-not-init TileAndMemTop:TileAndMemTop:_mem \
  --do-not-cover TileAndMemTop:TileAndMemTop
