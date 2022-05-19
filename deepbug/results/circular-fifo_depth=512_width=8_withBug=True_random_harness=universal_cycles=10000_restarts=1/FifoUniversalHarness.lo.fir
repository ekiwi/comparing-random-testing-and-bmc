circuit FifoUniversalHarness :
  module CircularPointerFifo :
    input clock : Clock
    input reset : UInt<1>
    input io_push : UInt<1>
    input io_pop : UInt<1>
    input io_data_in : UInt<8>
    output io_full : UInt<1>
    output io_empty : UInt<1>
    output io_data_out : UInt<8>

    mem entries : @[CircularPointerFifo.scala 38:20]
      data-type => UInt<8>
      depth => 513
      read-latency => 0
      write-latency => 1
      reader => input_data_MPORT
      reader => io_data_out_MPORT
      writer => MPORT
      read-under-write => undefined
    reg cnt : UInt<11>, clock with :
      reset => (UInt<1>("h0"), cnt) @[CircularPointerFifo.scala 25:20]
    node _cnt_T = add(cnt, io_push) @[CircularPointerFifo.scala 26:14]
    node _cnt_T_1 = tail(_cnt_T, 1) @[CircularPointerFifo.scala 26:14]
    node _cnt_T_2 = sub(_cnt_T_1, io_pop) @[CircularPointerFifo.scala 26:24]
    node _cnt_T_3 = tail(_cnt_T_2, 1) @[CircularPointerFifo.scala 26:24]
    reg wrPtr : UInt<10>, clock with :
      reset => (UInt<1>("h0"), wrPtr) @[CircularPointerFifo.scala 29:22]
    node _wrPtr_T = add(wrPtr, io_push) @[CircularPointerFifo.scala 30:18]
    node _wrPtr_T_1 = tail(_wrPtr_T, 1) @[CircularPointerFifo.scala 30:18]
    reg rdPtr : UInt<10>, clock with :
      reset => (UInt<1>("h0"), rdPtr) @[CircularPointerFifo.scala 32:22]
    node _rdPtr_T = add(rdPtr, io_pop) @[CircularPointerFifo.scala 33:18]
    node _rdPtr_T_1 = tail(_rdPtr_T, 1) @[CircularPointerFifo.scala 33:18]
    node _io_empty_T = eq(cnt, UInt<1>("h0")) @[CircularPointerFifo.scala 35:19]
    node _io_full_T = eq(cnt, UInt<10>("h201")) @[CircularPointerFifo.scala 36:18]
    node input_data = mux(io_push, io_data_in, entries.input_data_MPORT.data) @[CircularPointerFifo.scala 39:23]
    io_full <= _io_full_T @[CircularPointerFifo.scala 36:11]
    io_empty <= _io_empty_T @[CircularPointerFifo.scala 35:12]
    io_data_out <= entries.io_data_out_MPORT.data @[CircularPointerFifo.scala 43:17]
    cnt <= mux(reset, UInt<11>("h0"), _cnt_T_3) @[CircularPointerFifo.scala 25:{20,20} 26:7]
    wrPtr <= mux(reset, UInt<10>("h0"), _wrPtr_T_1) @[CircularPointerFifo.scala 29:{22,22} 30:9]
    rdPtr <= mux(reset, UInt<10>("h0"), _rdPtr_T_1) @[CircularPointerFifo.scala 32:{22,22} 33:9]
    entries.input_data_MPORT.addr <= wrPtr @[CircularPointerFifo.scala 39:57]
    entries.input_data_MPORT.en <= UInt<1>("h1") @[CircularPointerFifo.scala 39:57]
    entries.input_data_MPORT.clk <= clock @[CircularPointerFifo.scala 39:57]
    entries.io_data_out_MPORT.addr <= rdPtr @[CircularPointerFifo.scala 43:32]
    entries.io_data_out_MPORT.en <= UInt<1>("h1") @[CircularPointerFifo.scala 43:32]
    entries.io_data_out_MPORT.clk <= clock @[CircularPointerFifo.scala 43:32]
    entries.MPORT.addr <= wrPtr
    entries.MPORT.en <= UInt<1>("h1")
    entries.MPORT.clk <= clock
    entries.MPORT.data <= input_data
    entries.MPORT.mask <= UInt<1>("h1")

  module Queue :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits : UInt<8>
    input io_deq_ready : UInt<1>
    output io_deq_valid : UInt<1>
    output io_deq_bits : UInt<8>
    output io_count : UInt<10>

    mem ram : @[Decoupled.scala 259:95]
      data-type => UInt<8>
      depth => 512
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    reg enq_ptr_value : UInt<9>, clock with :
      reset => (UInt<1>("h0"), enq_ptr_value) @[Counter.scala 62:40]
    reg deq_ptr_value : UInt<9>, clock with :
      reset => (UInt<1>("h0"), deq_ptr_value) @[Counter.scala 62:40]
    reg maybe_full : UInt<1>, clock with :
      reset => (UInt<1>("h0"), maybe_full) @[Decoupled.scala 262:27]
    node ptr_match = eq(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 263:33]
    node _empty_T = eq(maybe_full, UInt<1>("h0")) @[Decoupled.scala 264:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 264:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 265:24]
    node _do_enq_T = and(io_enq_ready, io_enq_valid) @[Decoupled.scala 50:35]
    node _do_deq_T = and(io_deq_ready, io_deq_valid) @[Decoupled.scala 50:35]
    node wrap = eq(enq_ptr_value, UInt<9>("h1ff")) @[Counter.scala 74:24]
    node _value_T = add(enq_ptr_value, UInt<1>("h1")) @[Counter.scala 78:24]
    node _value_T_1 = tail(_value_T, 1) @[Counter.scala 78:24]
    node _GEN_12 = mux(io_deq_ready, UInt<1>("h0"), _do_enq_T) @[Decoupled.scala 304:{26,35}]
    node _GEN_15 = mux(empty, _GEN_12, _do_enq_T) @[Decoupled.scala 301:17]
    node do_enq = _GEN_15
    node _GEN_0 = validif(do_enq, enq_ptr_value) @[Decoupled.scala 272:16 273:8]
    node _GEN_1 = validif(do_enq, clock) @[Decoupled.scala 272:16 273:8]
    node _GEN_2 = mux(do_enq, UInt<1>("h1"), UInt<1>("h0")) @[Decoupled.scala 272:16 273:8 259:95]
    node _GEN_3 = validif(do_enq, UInt<1>("h1")) @[Decoupled.scala 272:16 273:24]
    node _GEN_4 = validif(do_enq, io_enq_bits) @[Decoupled.scala 272:16 273:24]
    node _GEN_5 = mux(do_enq, _value_T_1, enq_ptr_value) @[Decoupled.scala 272:16 Counter.scala 78:15 62:40]
    node wrap_1 = eq(deq_ptr_value, UInt<9>("h1ff")) @[Counter.scala 74:24]
    node _value_T_2 = add(deq_ptr_value, UInt<1>("h1")) @[Counter.scala 78:24]
    node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 78:24]
    node _GEN_14 = mux(empty, UInt<1>("h0"), _do_deq_T) @[Decoupled.scala 301:17 303:14]
    node do_deq = _GEN_14
    node _GEN_6 = mux(do_deq, _value_T_3, deq_ptr_value) @[Decoupled.scala 276:16 Counter.scala 78:15 62:40]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 279:15]
    node _GEN_7 = mux(_T, do_enq, maybe_full) @[Decoupled.scala 279:27 280:16 262:27]
    node _GEN_8 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_5) @[Decoupled.scala 282:15 Counter.scala 99:11]
    node _GEN_9 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_6) @[Decoupled.scala 282:15 Counter.scala 99:11]
    node _GEN_10 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_7) @[Decoupled.scala 282:15 285:16]
    node _io_deq_valid_T = eq(empty, UInt<1>("h0")) @[Decoupled.scala 288:19]
    node _io_enq_ready_T = eq(full, UInt<1>("h0")) @[Decoupled.scala 289:19]
    node _GEN_11 = mux(io_enq_valid, UInt<1>("h1"), _io_deq_valid_T) @[Decoupled.scala 288:16 300:{24,39}]
    node _GEN_13 = mux(empty, io_enq_bits, ram.io_deq_bits_MPORT.data) @[Decoupled.scala 296:17 301:17 302:19]
    node _GEN_16 = mux(io_deq_ready, UInt<1>("h1"), _io_enq_ready_T) @[Decoupled.scala 289:16 309:{24,39}]
    node _ptr_diff_T = sub(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 312:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 312:32]
    node _io_count_T = and(maybe_full, ptr_match) @[Decoupled.scala 315:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<10>("h200"), UInt<1>("h0")) @[Decoupled.scala 315:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[Decoupled.scala 315:62]
    io_enq_ready <= _GEN_16
    io_deq_valid <= _GEN_11
    io_deq_bits <= _GEN_13
    io_count <= _io_count_T_2 @[Decoupled.scala 315:14]
    ram.io_deq_bits_MPORT.addr <= deq_ptr_value @[Decoupled.scala 296:23]
    ram.io_deq_bits_MPORT.en <= UInt<1>("h1") @[Decoupled.scala 296:23]
    ram.io_deq_bits_MPORT.clk <= clock @[Decoupled.scala 296:23]
    ram.MPORT.addr <= _GEN_0
    ram.MPORT.en <= _GEN_2
    ram.MPORT.clk <= _GEN_1
    ram.MPORT.data <= _GEN_4
    ram.MPORT.mask <= _GEN_3
    enq_ptr_value <= mux(reset, UInt<9>("h0"), _GEN_8) @[Counter.scala 62:{40,40}]
    deq_ptr_value <= mux(reset, UInt<9>("h0"), _GEN_9) @[Counter.scala 62:{40,40}]
    maybe_full <= mux(reset, UInt<1>("h0"), _GEN_10) @[Decoupled.scala 262:{27,27}]

  module FifoUniversalHarness :
    input clock : Clock
    input reset : UInt<1>
    input tryPush_valid : UInt<1>
    input tryPush_bits : UInt<8>
    input tryPop : UInt<1>

    inst dut of CircularPointerFifo @[FifoUniversalHarness.scala 9:19]
    inst reference of Queue @[FifoUniversalHarness.scala 21:25]
    node _dut_io_push_T = eq(dut.io_full, UInt<1>("h0")) @[FifoUniversalHarness.scala 14:35]
    node _dut_io_push_T_1 = and(tryPush_valid, _dut_io_push_T) @[FifoUniversalHarness.scala 14:32]
    node _dut_io_pop_T = eq(dut.io_empty, UInt<1>("h0")) @[FifoUniversalHarness.scala 18:27]
    node _dut_io_pop_T_1 = and(tryPop, _dut_io_pop_T) @[FifoUniversalHarness.scala 18:24]
    node _T = neq(reference.io_count, UInt<1>("h0")) @[FifoUniversalHarness.scala 26:31]
    node _T_1 = bits(reset, 0, 0) @[FifoUniversalHarness.scala 26:11]
    node _T_2 = eq(_T_1, UInt<1>("h0")) @[FifoUniversalHarness.scala 26:11]
    node _T_3 = eq(_T, UInt<1>("h0")) @[FifoUniversalHarness.scala 26:11]
    node _T_4 = eq(reference.io_deq_bits, dut.io_data_out) @[FifoUniversalHarness.scala 28:29]
    node _T_5 = bits(reset, 0, 0) @[FifoUniversalHarness.scala 27:11]
    node _T_6 = eq(_T_5, UInt<1>("h0")) @[FifoUniversalHarness.scala 27:11]
    node _T_7 = eq(_T_4, UInt<1>("h0")) @[FifoUniversalHarness.scala 27:11]
    dut.clock <= clock
    dut.reset <= reset
    dut.io_push <= _dut_io_push_T_1 @[FifoUniversalHarness.scala 14:15]
    dut.io_pop <= _dut_io_pop_T_1 @[FifoUniversalHarness.scala 18:14]
    dut.io_data_in <= tryPush_bits @[FifoUniversalHarness.scala 13:18]
    reference.clock <= clock
    reference.reset <= reset
    reference.io_enq_valid <= dut.io_push @[FifoUniversalHarness.scala 22:26]
    reference.io_enq_bits <= dut.io_data_in @[FifoUniversalHarness.scala 23:25]
    reference.io_deq_ready <= dut.io_pop @[FifoUniversalHarness.scala 24:26]
    printf(clock, and(and(and(and(UInt<1>("h1"), dut.io_pop), _T_2), _T_3), UInt<1>("h1")), "Assertion failed: Queue is empty, but hardware does not signal that fact!\n    at FifoUniversalHarness.scala:26 assert(reference.io.count =/= 0.U, \"Queue is empty, but hardware does not signal that fact!\")\n") : printf @[FifoUniversalHarness.scala 26:11]
    assert(clock, _T, and(and(and(UInt<1>("h1"), dut.io_pop), _T_2), UInt<1>("h1")), "") : assert @[FifoUniversalHarness.scala 26:11]
    printf(clock, and(and(and(and(UInt<1>("h1"), dut.io_pop), _T_6), _T_7), UInt<1>("h1")), "Assertion failed: Expected to dequeue: %x, got %x instead!\n    at FifoUniversalHarness.scala:27 assert(\n", reference.io_deq_bits, dut.io_data_out) : printf_1 @[FifoUniversalHarness.scala 27:11]
    assert(clock, _T_4, and(and(and(UInt<1>("h1"), dut.io_pop), _T_6), UInt<1>("h1")), "") : assert_1 @[FifoUniversalHarness.scala 27:11]
