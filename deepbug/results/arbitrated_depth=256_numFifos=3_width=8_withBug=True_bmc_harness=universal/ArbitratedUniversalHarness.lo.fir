circuit ArbitratedUniversalHarness :
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
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => input_data_MPORT
      reader => io_data_out_MPORT
      writer => MPORT
      read-under-write => undefined
    reg cnt : UInt<9>, clock with :
      reset => (UInt<1>("h0"), cnt) @[CircularPointerFifo.scala 25:20]
    node _cnt_T = add(cnt, io_push) @[CircularPointerFifo.scala 26:14]
    node _cnt_T_1 = tail(_cnt_T, 1) @[CircularPointerFifo.scala 26:14]
    node _cnt_T_2 = sub(_cnt_T_1, io_pop) @[CircularPointerFifo.scala 26:24]
    node _cnt_T_3 = tail(_cnt_T_2, 1) @[CircularPointerFifo.scala 26:24]
    reg wrPtr : UInt<8>, clock with :
      reset => (UInt<1>("h0"), wrPtr) @[CircularPointerFifo.scala 29:22]
    node _wrPtr_T = add(wrPtr, io_push) @[CircularPointerFifo.scala 30:18]
    node _wrPtr_T_1 = tail(_wrPtr_T, 1) @[CircularPointerFifo.scala 30:18]
    reg rdPtr : UInt<8>, clock with :
      reset => (UInt<1>("h0"), rdPtr) @[CircularPointerFifo.scala 32:22]
    node _rdPtr_T = add(rdPtr, io_pop) @[CircularPointerFifo.scala 33:18]
    node _rdPtr_T_1 = tail(_rdPtr_T, 1) @[CircularPointerFifo.scala 33:18]
    node _io_empty_T = eq(cnt, UInt<1>("h0")) @[CircularPointerFifo.scala 35:19]
    node _io_full_T = eq(cnt, UInt<9>("h100")) @[CircularPointerFifo.scala 36:18]
    node input_data = mux(io_push, io_data_in, entries.input_data_MPORT.data) @[CircularPointerFifo.scala 39:23]
    io_full <= _io_full_T @[CircularPointerFifo.scala 36:11]
    io_empty <= _io_empty_T @[CircularPointerFifo.scala 35:12]
    io_data_out <= entries.io_data_out_MPORT.data @[CircularPointerFifo.scala 43:17]
    cnt <= mux(reset, UInt<9>("h0"), _cnt_T_3) @[CircularPointerFifo.scala 25:{20,20} 26:7]
    wrPtr <= mux(reset, UInt<8>("h0"), _wrPtr_T_1) @[CircularPointerFifo.scala 29:{22,22} 30:9]
    rdPtr <= mux(reset, UInt<8>("h0"), _rdPtr_T_1) @[CircularPointerFifo.scala 32:{22,22} 33:9]
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

  module CreditCounter :
    input clock : Clock
    input reset : UInt<1>
    input inc : UInt<1>
    input dec : UInt<1>
    output has_credits : UInt<1>
    output creditIsMax : UInt<1>

    reg credits : UInt<9>, clock with :
      reset => (UInt<1>("h0"), credits) @[ArbitratedTop.scala 73:24]
    node _credits_T = add(credits, inc) @[ArbitratedTop.scala 74:22]
    node _credits_T_1 = tail(_credits_T, 1) @[ArbitratedTop.scala 74:22]
    node _credits_T_2 = sub(_credits_T_1, dec) @[ArbitratedTop.scala 74:28]
    node _credits_T_3 = tail(_credits_T_2, 1) @[ArbitratedTop.scala 74:28]
    node _has_credits_T = gt(credits, UInt<1>("h0")) @[ArbitratedTop.scala 75:26]
    node _T = neq(credits, UInt<9>("h100")) @[ArbitratedTop.scala 78:18]
    node _T_1 = eq(inc, UInt<1>("h0")) @[ArbitratedTop.scala 78:38]
    node _T_2 = or(_T, _T_1) @[ArbitratedTop.scala 78:35]
    node _T_3 = asUInt(reset) @[ArbitratedTop.scala 78:9]
    node _T_4 = eq(_T_3, UInt<1>("h0")) @[ArbitratedTop.scala 78:9]
    node _T_5 = eq(_T_2, UInt<1>("h0")) @[ArbitratedTop.scala 78:9]
    node _creditIsMax_T = eq(credits, UInt<9>("h100")) @[ArbitratedTop.scala 84:26]
    has_credits <= _has_credits_T @[ArbitratedTop.scala 75:15]
    creditIsMax <= _creditIsMax_T @[ArbitratedTop.scala 84:15]
    credits <= mux(reset, UInt<9>("h101"), _credits_T_3) @[ArbitratedTop.scala 73:{24,24} 74:11]
    printf(clock, and(and(and(UInt<1>("h1"), _T_4), _T_5), UInt<1>("h1")), "Assumption failed\n    at ArbitratedTop.scala:78 assume(credits =/= creditsMax.U || !inc)\n") : printf @[ArbitratedTop.scala 78:9]
    assume(clock, _T_2, and(and(UInt<1>("h1"), _T_4), UInt<1>("h1")), "") : assume @[ArbitratedTop.scala 78:9]

  module ArbitratedTop :
    input clock : Clock
    input reset : UInt<1>
    input io_push_0 : UInt<1>
    input io_push_1 : UInt<1>
    input io_push_2 : UInt<1>
    input io_data_in_0 : UInt<8>
    input io_data_in_1 : UInt<8>
    input io_data_in_2 : UInt<8>
    input io_req : UInt<1>
    input io_gnt_sel : UInt<2>
    output io_data_out : UInt<8>
    output io_gnt_0 : UInt<1>
    output io_gnt_1 : UInt<1>
    output io_gnt_2 : UInt<1>
    output empty_0 : UInt<1>
    output empty_1 : UInt<1>
    output empty_2 : UInt<1>
    output has_credit_0 : UInt<1>
    output has_credit_1 : UInt<1>
    output has_credit_2 : UInt<1>
    output creditIsMax_0 : UInt<1>
    output creditIsMax_1 : UInt<1>
    output creditIsMax_2 : UInt<1>

    inst fifo of CircularPointerFifo @[ArbitratedTop.scala 30:22]
    inst cc of CreditCounter @[ArbitratedTop.scala 38:20]
    inst fifo_1 of CircularPointerFifo @[ArbitratedTop.scala 30:22]
    inst cc_1 of CreditCounter @[ArbitratedTop.scala 38:20]
    inst fifo_2 of CircularPointerFifo @[ArbitratedTop.scala 30:22]
    inst cc_2 of CreditCounter @[ArbitratedTop.scala 38:20]
    node _io_gnt_0_T = eq(io_gnt_sel, UInt<1>("h0")) @[ArbitratedTop.scala 45:41]
    node _io_gnt_0_T_1 = and(io_req, _io_gnt_0_T) @[ArbitratedTop.scala 45:26]
    node _io_gnt_1_T = eq(io_gnt_sel, UInt<1>("h1")) @[ArbitratedTop.scala 45:41]
    node _io_gnt_1_T_1 = and(io_req, _io_gnt_1_T) @[ArbitratedTop.scala 45:26]
    node _io_gnt_2_T = eq(io_gnt_sel, UInt<2>("h2")) @[ArbitratedTop.scala 45:41]
    node _io_gnt_2_T_1 = and(io_req, _io_gnt_2_T) @[ArbitratedTop.scala 45:26]
    node fifo_data_out_0 = fifo.io_data_out @[ArbitratedTop.scala 23:27 36:23]
    node _io_data_out_T = mux(io_gnt_0, fifo_data_out_0, UInt<1>("h0")) @[Mux.scala 27:73]
    node fifo_data_out_1 = fifo_1.io_data_out @[ArbitratedTop.scala 23:27 36:23]
    node _io_data_out_T_1 = mux(io_gnt_1, fifo_data_out_1, UInt<1>("h0")) @[Mux.scala 27:73]
    node fifo_data_out_2 = fifo_2.io_data_out @[ArbitratedTop.scala 23:27 36:23]
    node _io_data_out_T_2 = mux(io_gnt_2, fifo_data_out_2, UInt<1>("h0")) @[Mux.scala 27:73]
    node _io_data_out_T_3 = or(_io_data_out_T, _io_data_out_T_1) @[Mux.scala 27:73]
    node _io_data_out_T_4 = or(_io_data_out_T_3, _io_data_out_T_2) @[Mux.scala 27:73]
    node _T = eq(io_push_0, UInt<1>("h0")) @[ArbitratedTop.scala 54:30]
    node _T_1 = or(has_credit_0, _T) @[ArbitratedTop.scala 54:27]
    node _T_2 = asUInt(reset) @[ArbitratedTop.scala 54:11]
    node _T_3 = eq(_T_2, UInt<1>("h0")) @[ArbitratedTop.scala 54:11]
    node _T_4 = eq(_T_1, UInt<1>("h0")) @[ArbitratedTop.scala 54:11]
    node _T_5 = eq(empty_0, UInt<1>("h0")) @[ArbitratedTop.scala 56:12]
    node _T_6 = eq(io_gnt_0, UInt<1>("h0")) @[ArbitratedTop.scala 56:26]
    node _T_7 = or(_T_5, _T_6) @[ArbitratedTop.scala 56:23]
    node _T_8 = asUInt(reset) @[ArbitratedTop.scala 56:11]
    node _T_9 = eq(_T_8, UInt<1>("h0")) @[ArbitratedTop.scala 56:11]
    node _T_10 = eq(_T_7, UInt<1>("h0")) @[ArbitratedTop.scala 56:11]
    node _T_11 = eq(io_push_1, UInt<1>("h0")) @[ArbitratedTop.scala 54:30]
    node _T_12 = or(has_credit_1, _T_11) @[ArbitratedTop.scala 54:27]
    node _T_13 = asUInt(reset) @[ArbitratedTop.scala 54:11]
    node _T_14 = eq(_T_13, UInt<1>("h0")) @[ArbitratedTop.scala 54:11]
    node _T_15 = eq(_T_12, UInt<1>("h0")) @[ArbitratedTop.scala 54:11]
    node _T_16 = eq(empty_1, UInt<1>("h0")) @[ArbitratedTop.scala 56:12]
    node _T_17 = eq(io_gnt_1, UInt<1>("h0")) @[ArbitratedTop.scala 56:26]
    node _T_18 = or(_T_16, _T_17) @[ArbitratedTop.scala 56:23]
    node _T_19 = asUInt(reset) @[ArbitratedTop.scala 56:11]
    node _T_20 = eq(_T_19, UInt<1>("h0")) @[ArbitratedTop.scala 56:11]
    node _T_21 = eq(_T_18, UInt<1>("h0")) @[ArbitratedTop.scala 56:11]
    node _T_22 = eq(io_push_2, UInt<1>("h0")) @[ArbitratedTop.scala 54:30]
    node _T_23 = or(has_credit_2, _T_22) @[ArbitratedTop.scala 54:27]
    node _T_24 = asUInt(reset) @[ArbitratedTop.scala 54:11]
    node _T_25 = eq(_T_24, UInt<1>("h0")) @[ArbitratedTop.scala 54:11]
    node _T_26 = eq(_T_23, UInt<1>("h0")) @[ArbitratedTop.scala 54:11]
    node _T_27 = eq(empty_2, UInt<1>("h0")) @[ArbitratedTop.scala 56:12]
    node _T_28 = eq(io_gnt_2, UInt<1>("h0")) @[ArbitratedTop.scala 56:26]
    node _T_29 = or(_T_27, _T_28) @[ArbitratedTop.scala 56:23]
    node _T_30 = asUInt(reset) @[ArbitratedTop.scala 56:11]
    node _T_31 = eq(_T_30, UInt<1>("h0")) @[ArbitratedTop.scala 56:11]
    node _T_32 = eq(_T_29, UInt<1>("h0")) @[ArbitratedTop.scala 56:11]
    node full_0 = fifo.io_full @[ArbitratedTop.scala 22:18 35:14]
    node full_1 = fifo_1.io_full @[ArbitratedTop.scala 22:18 35:14]
    node full_2 = fifo_2.io_full @[ArbitratedTop.scala 22:18 35:14]
    node _io_data_out_WIRE = _io_data_out_T_4 @[Mux.scala 27:{73,73}]
    io_data_out <= _io_data_out_WIRE @[ArbitratedTop.scala 49:15]
    io_gnt_0 <= _io_gnt_0_T_1 @[ArbitratedTop.scala 45:16]
    io_gnt_1 <= _io_gnt_1_T_1 @[ArbitratedTop.scala 45:16]
    io_gnt_2 <= _io_gnt_2_T_1 @[ArbitratedTop.scala 45:16]
    empty_0 <= fifo.io_empty @[ArbitratedTop.scala 34:15]
    empty_1 <= fifo_1.io_empty @[ArbitratedTop.scala 34:15]
    empty_2 <= fifo_2.io_empty @[ArbitratedTop.scala 34:15]
    has_credit_0 <= cc.has_credits @[ArbitratedTop.scala 41:20]
    has_credit_1 <= cc_1.has_credits @[ArbitratedTop.scala 41:20]
    has_credit_2 <= cc_2.has_credits @[ArbitratedTop.scala 41:20]
    creditIsMax_0 <= cc.creditIsMax @[ArbitratedTop.scala 42:21]
    creditIsMax_1 <= cc_1.creditIsMax @[ArbitratedTop.scala 42:21]
    creditIsMax_2 <= cc_2.creditIsMax @[ArbitratedTop.scala 42:21]
    fifo.clock <= clock
    fifo.reset <= reset
    fifo.io_push <= io_push_0 @[ArbitratedTop.scala 31:18]
    fifo.io_pop <= io_gnt_0 @[ArbitratedTop.scala 32:17]
    fifo.io_data_in <= io_data_in_0 @[ArbitratedTop.scala 33:21]
    cc.clock <= clock
    cc.reset <= reset
    cc.inc <= io_gnt_0 @[ArbitratedTop.scala 39:12]
    cc.dec <= io_push_0 @[ArbitratedTop.scala 40:12]
    fifo_1.clock <= clock
    fifo_1.reset <= reset
    fifo_1.io_push <= io_push_1 @[ArbitratedTop.scala 31:18]
    fifo_1.io_pop <= io_gnt_1 @[ArbitratedTop.scala 32:17]
    fifo_1.io_data_in <= io_data_in_1 @[ArbitratedTop.scala 33:21]
    cc_1.clock <= clock
    cc_1.reset <= reset
    cc_1.inc <= io_gnt_1 @[ArbitratedTop.scala 39:12]
    cc_1.dec <= io_push_1 @[ArbitratedTop.scala 40:12]
    fifo_2.clock <= clock
    fifo_2.reset <= reset
    fifo_2.io_push <= io_push_2 @[ArbitratedTop.scala 31:18]
    fifo_2.io_pop <= io_gnt_2 @[ArbitratedTop.scala 32:17]
    fifo_2.io_data_in <= io_data_in_2 @[ArbitratedTop.scala 33:21]
    cc_2.clock <= clock
    cc_2.reset <= reset
    cc_2.inc <= io_gnt_2 @[ArbitratedTop.scala 39:12]
    cc_2.dec <= io_push_2 @[ArbitratedTop.scala 40:12]
    printf(clock, and(and(and(UInt<1>("h1"), _T_3), _T_4), UInt<1>("h1")), "Assumption failed\n    at ArbitratedTop.scala:54 assume(has_credit(ii) || !io.push(ii))\n") : printf @[ArbitratedTop.scala 54:11]
    assume(clock, _T_1, and(and(UInt<1>("h1"), _T_3), UInt<1>("h1")), "") : assume @[ArbitratedTop.scala 54:11]
    printf(clock, and(and(and(UInt<1>("h1"), _T_9), _T_10), UInt<1>("h1")), "Assumption failed\n    at ArbitratedTop.scala:56 assume(!empty(ii) || !io.gnt(ii))\n") : printf_1 @[ArbitratedTop.scala 56:11]
    assume(clock, _T_7, and(and(UInt<1>("h1"), _T_9), UInt<1>("h1")), "") : assume_1 @[ArbitratedTop.scala 56:11]
    printf(clock, and(and(and(UInt<1>("h1"), _T_14), _T_15), UInt<1>("h1")), "Assumption failed\n    at ArbitratedTop.scala:54 assume(has_credit(ii) || !io.push(ii))\n") : printf_2 @[ArbitratedTop.scala 54:11]
    assume(clock, _T_12, and(and(UInt<1>("h1"), _T_14), UInt<1>("h1")), "") : assume_2 @[ArbitratedTop.scala 54:11]
    printf(clock, and(and(and(UInt<1>("h1"), _T_20), _T_21), UInt<1>("h1")), "Assumption failed\n    at ArbitratedTop.scala:56 assume(!empty(ii) || !io.gnt(ii))\n") : printf_3 @[ArbitratedTop.scala 56:11]
    assume(clock, _T_18, and(and(UInt<1>("h1"), _T_20), UInt<1>("h1")), "") : assume_3 @[ArbitratedTop.scala 56:11]
    printf(clock, and(and(and(UInt<1>("h1"), _T_25), _T_26), UInt<1>("h1")), "Assumption failed\n    at ArbitratedTop.scala:54 assume(has_credit(ii) || !io.push(ii))\n") : printf_4 @[ArbitratedTop.scala 54:11]
    assume(clock, _T_23, and(and(UInt<1>("h1"), _T_25), UInt<1>("h1")), "") : assume_4 @[ArbitratedTop.scala 54:11]
    printf(clock, and(and(and(UInt<1>("h1"), _T_31), _T_32), UInt<1>("h1")), "Assumption failed\n    at ArbitratedTop.scala:56 assume(!empty(ii) || !io.gnt(ii))\n") : printf_5 @[ArbitratedTop.scala 56:11]
    assume(clock, _T_29, and(and(UInt<1>("h1"), _T_31), UInt<1>("h1")), "") : assume_5 @[ArbitratedTop.scala 56:11]

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

  module ArbitratedUniversalHarness :
    input clock : Clock
    input reset : UInt<1>
    input tryPush_0 : UInt<1>
    input tryPush_1 : UInt<1>
    input tryPush_2 : UInt<1>
    input fifoDataIn_0 : UInt<8>
    input fifoDataIn_1 : UInt<8>
    input fifoDataIn_2 : UInt<8>
    input tryReq : UInt<1>
    input selectShift : UInt<2>

    inst dut of ArbitratedTop @[ArbitratedUniversalHarness.scala 9:19]
    inst queues_0 of Queue @[ArbitratedUniversalHarness.scala 18:32]
    inst queues_1 of Queue @[ArbitratedUniversalHarness.scala 18:32]
    inst queues_2 of Queue @[ArbitratedUniversalHarness.scala 18:32]
    node _T = and(tryPush_0, dut.has_credit_0) @[ArbitratedUniversalHarness.scala 25:69]
    node _T_1 = and(tryPush_1, dut.has_credit_1) @[ArbitratedUniversalHarness.scala 25:69]
    node _T_2 = and(tryPush_2, dut.has_credit_2) @[ArbitratedUniversalHarness.scala 25:69]
    node available_hi = cat(dut.empty_2, dut.empty_1) @[ArbitratedUniversalHarness.scala 29:37]
    node _available_T = cat(available_hi, dut.empty_0) @[ArbitratedUniversalHarness.scala 29:37]
    node _available_T_1 = not(_available_T) @[ArbitratedUniversalHarness.scala 29:26]
    node available_hi_1 = cat(dut.creditIsMax_2, dut.creditIsMax_1) @[ArbitratedUniversalHarness.scala 29:65]
    node _available_T_2 = cat(available_hi_1, dut.creditIsMax_0) @[ArbitratedUniversalHarness.scala 29:65]
    node _available_T_3 = not(_available_T_2) @[ArbitratedUniversalHarness.scala 29:48]
    node available = and(_available_T_1, _available_T_3) @[ArbitratedUniversalHarness.scala 29:45]
    node _dut_io_req_T = neq(available, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 30:37]
    node _dut_io_req_T_1 = and(tryReq, _dut_io_req_T) @[ArbitratedUniversalHarness.scala 30:24]
    node _availableRotated_T = bits(selectShift, 0, 0) @[ArbitratedUniversalHarness.scala 33:46]
    node _availableRotated_T_1 = bits(selectShift, 1, 1) @[ArbitratedUniversalHarness.scala 33:46]
    node _availableRotated_T_2 = tail(available, 1) @[ArbitratedUniversalHarness.scala 33:46]
    node _availableRotated_T_3 = head(available, 1) @[ArbitratedUniversalHarness.scala 33:46]
    node _availableRotated_T_4 = cat(_availableRotated_T_2, _availableRotated_T_3) @[ArbitratedUniversalHarness.scala 33:46]
    node _availableRotated_T_5 = mux(_availableRotated_T, _availableRotated_T_4, available) @[ArbitratedUniversalHarness.scala 33:46]
    node _availableRotated_T_6 = tail(_availableRotated_T_5, 2) @[ArbitratedUniversalHarness.scala 33:46]
    node _availableRotated_T_7 = head(_availableRotated_T_5, 2) @[ArbitratedUniversalHarness.scala 33:46]
    node _availableRotated_T_8 = cat(_availableRotated_T_6, _availableRotated_T_7) @[ArbitratedUniversalHarness.scala 33:46]
    node availableRotated = mux(_availableRotated_T_1, _availableRotated_T_8, _availableRotated_T_5) @[ArbitratedUniversalHarness.scala 33:46]
    node _availableRotatedOH_T = bits(availableRotated, 0, 0) @[OneHot.scala 84:71]
    node _availableRotatedOH_T_1 = bits(availableRotated, 1, 1) @[OneHot.scala 84:71]
    node _availableRotatedOH_T_2 = bits(availableRotated, 2, 2) @[OneHot.scala 84:71]
    node _availableRotatedOH_T_3 = mux(_availableRotatedOH_T_2, UInt<3>("h4"), UInt<3>("h0")) @[Mux.scala 47:70]
    node _availableRotatedOH_T_4 = mux(_availableRotatedOH_T_1, UInt<3>("h2"), _availableRotatedOH_T_3) @[Mux.scala 47:70]
    node availableRotatedOH = mux(_availableRotatedOH_T, UInt<3>("h1"), _availableRotatedOH_T_4) @[Mux.scala 47:70]
    node _select_T = bits(selectShift, 0, 0) @[ArbitratedUniversalHarness.scala 35:46]
    node _select_T_1 = bits(selectShift, 1, 1) @[ArbitratedUniversalHarness.scala 35:46]
    node _select_T_2 = bits(availableRotatedOH, 0, 0) @[ArbitratedUniversalHarness.scala 35:46]
    node _select_T_3 = shr(availableRotatedOH, 1) @[ArbitratedUniversalHarness.scala 35:46]
    node _select_T_4 = cat(_select_T_2, _select_T_3) @[ArbitratedUniversalHarness.scala 35:46]
    node _select_T_5 = mux(_select_T, _select_T_4, availableRotatedOH) @[ArbitratedUniversalHarness.scala 35:46]
    node _select_T_6 = bits(_select_T_5, 1, 0) @[ArbitratedUniversalHarness.scala 35:46]
    node _select_T_7 = shr(_select_T_5, 2) @[ArbitratedUniversalHarness.scala 35:46]
    node _select_T_8 = cat(_select_T_6, _select_T_7) @[ArbitratedUniversalHarness.scala 35:46]
    node select = mux(_select_T_1, _select_T_8, _select_T_5) @[ArbitratedUniversalHarness.scala 35:46]
    node dut_io_gnt_sel_hi = bits(select, 2, 2) @[OneHot.scala 30:18]
    node dut_io_gnt_sel_lo = bits(select, 1, 0) @[OneHot.scala 31:18]
    node _dut_io_gnt_sel_T = orr(dut_io_gnt_sel_hi) @[OneHot.scala 32:14]
    node _dut_io_gnt_sel_T_1 = or(dut_io_gnt_sel_hi, dut_io_gnt_sel_lo) @[OneHot.scala 32:28]
    node _dut_io_gnt_sel_T_2 = bits(_dut_io_gnt_sel_T_1, 1, 1) @[CircuitMath.scala 30:8]
    node _dut_io_gnt_sel_T_3 = cat(_dut_io_gnt_sel_T, _dut_io_gnt_sel_T_2) @[OneHot.scala 32:10]
    node _T_3 = eq(dut.io_gnt_sel, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 46:27]
    node _T_4 = bits(reset, 0, 0) @[ArbitratedUniversalHarness.scala 48:15]
    node _T_5 = eq(_T_4, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 48:15]
    node _T_6 = eq(queues_0.io_deq_valid, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 48:15]
    node _T_7 = eq(queues_0.io_deq_bits, dut.io_data_out) @[ArbitratedUniversalHarness.scala 50:29]
    node _T_8 = bits(reset, 0, 0) @[ArbitratedUniversalHarness.scala 49:15]
    node _T_9 = eq(_T_8, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 49:15]
    node _T_10 = eq(_T_7, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 49:15]
    node _GEN_0 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 42:24 46:37 47:28]
    node _T_11 = eq(dut.io_gnt_sel, UInt<1>("h1")) @[ArbitratedUniversalHarness.scala 46:27]
    node _T_12 = bits(reset, 0, 0) @[ArbitratedUniversalHarness.scala 48:15]
    node _T_13 = eq(_T_12, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 48:15]
    node _T_14 = eq(queues_1.io_deq_valid, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 48:15]
    node _T_15 = eq(queues_1.io_deq_bits, dut.io_data_out) @[ArbitratedUniversalHarness.scala 50:29]
    node _T_16 = bits(reset, 0, 0) @[ArbitratedUniversalHarness.scala 49:15]
    node _T_17 = eq(_T_16, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 49:15]
    node _T_18 = eq(_T_15, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 49:15]
    node _GEN_1 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 42:24 46:37 47:28]
    node _T_19 = eq(dut.io_gnt_sel, UInt<2>("h2")) @[ArbitratedUniversalHarness.scala 46:27]
    node _T_20 = bits(reset, 0, 0) @[ArbitratedUniversalHarness.scala 48:15]
    node _T_21 = eq(_T_20, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 48:15]
    node _T_22 = eq(queues_2.io_deq_valid, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 48:15]
    node _T_23 = eq(queues_2.io_deq_bits, dut.io_data_out) @[ArbitratedUniversalHarness.scala 50:29]
    node _T_24 = bits(reset, 0, 0) @[ArbitratedUniversalHarness.scala 49:15]
    node _T_25 = eq(_T_24, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 49:15]
    node _T_26 = eq(_T_23, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 49:15]
    node _GEN_2 = mux(_T_19, UInt<1>("h1"), UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 42:24 46:37 47:28]
    node _GEN_3 = mux(dut.io_req, _GEN_0, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 44:20 42:24]
    node _GEN_4 = mux(dut.io_req, _GEN_1, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 44:20 42:24]
    node _GEN_5 = mux(dut.io_req, _GEN_2, UInt<1>("h0")) @[ArbitratedUniversalHarness.scala 44:20 42:24]
    dut.clock <= clock
    dut.reset <= reset
    dut.io_push_0 <= _T @[ArbitratedUniversalHarness.scala 25:15]
    dut.io_push_1 <= _T_1 @[ArbitratedUniversalHarness.scala 25:15]
    dut.io_push_2 <= _T_2 @[ArbitratedUniversalHarness.scala 25:15]
    dut.io_data_in_0 <= fifoDataIn_0 @[ArbitratedUniversalHarness.scala 23:18]
    dut.io_data_in_1 <= fifoDataIn_1 @[ArbitratedUniversalHarness.scala 23:18]
    dut.io_data_in_2 <= fifoDataIn_2 @[ArbitratedUniversalHarness.scala 23:18]
    dut.io_req <= _dut_io_req_T_1 @[ArbitratedUniversalHarness.scala 30:14]
    dut.io_gnt_sel <= _dut_io_gnt_sel_T_3 @[ArbitratedUniversalHarness.scala 36:18]
    queues_0.clock <= clock
    queues_0.reset <= reset
    queues_0.io_enq_valid <= dut.io_push_0 @[ArbitratedUniversalHarness.scala 40:24]
    queues_0.io_enq_bits <= dut.io_data_in_0 @[ArbitratedUniversalHarness.scala 41:23]
    queues_0.io_deq_ready <= _GEN_3
    queues_1.clock <= clock
    queues_1.reset <= reset
    queues_1.io_enq_valid <= dut.io_push_1 @[ArbitratedUniversalHarness.scala 40:24]
    queues_1.io_enq_bits <= dut.io_data_in_1 @[ArbitratedUniversalHarness.scala 41:23]
    queues_1.io_deq_ready <= _GEN_4
    queues_2.clock <= clock
    queues_2.reset <= reset
    queues_2.io_enq_valid <= dut.io_push_2 @[ArbitratedUniversalHarness.scala 40:24]
    queues_2.io_enq_bits <= dut.io_data_in_2 @[ArbitratedUniversalHarness.scala 41:23]
    queues_2.io_deq_ready <= _GEN_5
    printf(clock, and(and(and(and(and(UInt<1>("h1"), dut.io_req), _T_3), _T_5), _T_6), UInt<1>("h1")), "Assertion failed: Queue 0 is empty, but hardware does not signal that fact!\n    at ArbitratedUniversalHarness.scala:48 assert(queue.io.deq.valid, s\"Queue $ii is empty, but hardware does not signal that fact!\")\n") : printf @[ArbitratedUniversalHarness.scala 48:15]
    assert(clock, queues_0.io_deq_valid, and(and(and(and(UInt<1>("h1"), dut.io_req), _T_3), _T_5), UInt<1>("h1")), "") : assert @[ArbitratedUniversalHarness.scala 48:15]
    printf(clock, and(and(and(and(and(UInt<1>("h1"), dut.io_req), _T_3), _T_9), _T_10), UInt<1>("h1")), "Assertion failed: Expected to dequeue: %x, got %x instead! (0)\n    at ArbitratedUniversalHarness.scala:49 assert(\n", queues_0.io_deq_bits, dut.io_data_out) : printf_1 @[ArbitratedUniversalHarness.scala 49:15]
    assert(clock, _T_7, and(and(and(and(UInt<1>("h1"), dut.io_req), _T_3), _T_9), UInt<1>("h1")), "") : assert_1 @[ArbitratedUniversalHarness.scala 49:15]
    printf(clock, and(and(and(and(and(UInt<1>("h1"), dut.io_req), _T_11), _T_13), _T_14), UInt<1>("h1")), "Assertion failed: Queue 1 is empty, but hardware does not signal that fact!\n    at ArbitratedUniversalHarness.scala:48 assert(queue.io.deq.valid, s\"Queue $ii is empty, but hardware does not signal that fact!\")\n") : printf_2 @[ArbitratedUniversalHarness.scala 48:15]
    assert(clock, queues_1.io_deq_valid, and(and(and(and(UInt<1>("h1"), dut.io_req), _T_11), _T_13), UInt<1>("h1")), "") : assert_2 @[ArbitratedUniversalHarness.scala 48:15]
    printf(clock, and(and(and(and(and(UInt<1>("h1"), dut.io_req), _T_11), _T_17), _T_18), UInt<1>("h1")), "Assertion failed: Expected to dequeue: %x, got %x instead! (1)\n    at ArbitratedUniversalHarness.scala:49 assert(\n", queues_1.io_deq_bits, dut.io_data_out) : printf_3 @[ArbitratedUniversalHarness.scala 49:15]
    assert(clock, _T_15, and(and(and(and(UInt<1>("h1"), dut.io_req), _T_11), _T_17), UInt<1>("h1")), "") : assert_3 @[ArbitratedUniversalHarness.scala 49:15]
    printf(clock, and(and(and(and(and(UInt<1>("h1"), dut.io_req), _T_19), _T_21), _T_22), UInt<1>("h1")), "Assertion failed: Queue 2 is empty, but hardware does not signal that fact!\n    at ArbitratedUniversalHarness.scala:48 assert(queue.io.deq.valid, s\"Queue $ii is empty, but hardware does not signal that fact!\")\n") : printf_4 @[ArbitratedUniversalHarness.scala 48:15]
    assert(clock, queues_2.io_deq_valid, and(and(and(and(UInt<1>("h1"), dut.io_req), _T_19), _T_21), UInt<1>("h1")), "") : assert_4 @[ArbitratedUniversalHarness.scala 48:15]
    printf(clock, and(and(and(and(and(UInt<1>("h1"), dut.io_req), _T_19), _T_25), _T_26), UInt<1>("h1")), "Assertion failed: Expected to dequeue: %x, got %x instead! (2)\n    at ArbitratedUniversalHarness.scala:49 assert(\n", queues_2.io_deq_bits, dut.io_data_out) : printf_5 @[ArbitratedUniversalHarness.scala 49:15]
    assert(clock, _T_23, and(and(and(and(UInt<1>("h1"), dut.io_req), _T_19), _T_25), UInt<1>("h1")), "") : assert_5 @[ArbitratedUniversalHarness.scala 49:15]
