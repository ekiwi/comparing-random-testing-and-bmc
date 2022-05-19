#include "Vtop.h"
#include "verilated.h"

#define TOP_CLASS Vtop

#ifndef VM_TRACE_FST
#define VM_TRACE_FST 0
#endif

static const bool verbose = false;

#if VM_TRACE
#if VM_TRACE_FST
  #include "verilated_fst_c.h"
  #define VERILATED_C VerilatedFstC
#else // !(VM_TRACE_FST)
  #include "verilated_vcd_c.h"
  #define VERILATED_C VerilatedVcdC
#endif
#else // !(VM_TRACE)
  #define VERILATED_C VerilatedVcdC
#endif
#include <iostream>


static vluint64_t main_time = 0;
// required for asserts (until Verilator 4.200)
double sc_time_stamp () { return main_time; }


static void step(VERILATED_C* tfp, TOP_CLASS* top, vluint64_t& main_time) {
    top->clock = 0;
    top->eval();
#if VM_TRACE
    if (tfp) tfp->dump(main_time);
#endif
    main_time++;
    top->clock = 1;
    top->eval();
#if VM_TRACE
    if (tfp) tfp->dump(main_time);
#endif
    main_time++;
}

static void init_mem(uint64_t* mem, size_t len) {
  // fill memory
  size_t ii = 0;

  while(ii < len && !std::cin.eof()) {
    char buf[8];
    // try to read 8 bytes
    std::cin.read(buf, 8);
    // exit if fewer than 8 bytes were available
    if (std::cin.gcount() < 8) break;
    // write bytes to memory
    const uint64_t value =
      (static_cast<uint64_t>(buf[7]) & 0xff) << 56 |
      (static_cast<uint64_t>(buf[6]) & 0xff) << 48 |
      (static_cast<uint64_t>(buf[5]) & 0xff) << 40 |
      (static_cast<uint64_t>(buf[4]) & 0xff) << 32 |
      (static_cast<uint64_t>(buf[3]) & 0xff) << 24 |
      (static_cast<uint64_t>(buf[2]) & 0xff) << 16 |
      (static_cast<uint64_t>(buf[1]) & 0xff) <<  8 |
      (static_cast<uint64_t>(buf[0]) & 0xff) <<  0 ;
    if(value != 0) {
      // std::cout << "mem[" << ii << "] = " << value << ";" << std::endl;
    }
    mem[ii] = value;
    ii += 1;
  }

  // fill the rest of the memory with zeros
  for(; ii < len; ++ii) {
    mem[ii] = 0;
  }
}

static const int CYCLES = 250;

int main(int argc, char** argv) {
  Verilated::commandArgs(argc, argv);

  TOP_CLASS* dut = new TOP_CLASS;
  VERILATED_C* tfp = nullptr;
  std::string dumpfile = "dump.vcd";
  

#ifdef __AFL_HAVE_MANUAL_CONTROL
  // init AFL fuzz server
  __AFL_INIT();
#endif

  
  
#if VM_TRACE || VM_COVERAGE
  Verilated::traceEverOn(true);
#endif
#if VM_TRACE
  tfp = new VERILATED_C;
  dut->trace(tfp, 99);
  (tfp)->open(dumpfile.c_str());
#endif

  // init memory from stdin
  init_mem(dut->TileAndMemTop__DOT___mem, 1048576);

  // execute for CYCLES cycles
  for(int ii = 0; ii < CYCLES; ++ii) {
    step(tfp, dut, main_time);
  }


  #if VM_TRACE
  if (tfp) tfp->close();
  delete tfp;
#endif
#if VM_COVERAGE
  VerilatedCov::write("coverage.dat");
#endif
  dut->final();
  delete dut;
}

