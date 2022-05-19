circuit ArbitratedTop :
  module CircularPointerFifo :
    input clock : Clock
    input reset : UInt<1>
    input io_push : UInt<1>
    input io_pop : UInt<1>
    input io_data_in : UInt<64>
    output io_full : UInt<1>
    output io_empty : UInt<1>
    output io_data_out : UInt<64>

    mem entries : @[CircularPointerFifo.scala 38:20]
      data-type => UInt<64>
      depth => 2048
      read-latency => 0
      write-latency => 1
      reader => input_data_MPORT
      reader => io_data_out_MPORT
      writer => MPORT
      read-under-write => undefined
    reg cnt : UInt<12>, clock with :
      reset => (UInt<1>("h0"), cnt) @[CircularPointerFifo.scala 25:20]
    node _cnt_T = add(cnt, io_push) @[CircularPointerFifo.scala 26:14]
    node _cnt_T_1 = tail(_cnt_T, 1) @[CircularPointerFifo.scala 26:14]
    node _cnt_T_2 = sub(_cnt_T_1, io_pop) @[CircularPointerFifo.scala 26:24]
    node _cnt_T_3 = tail(_cnt_T_2, 1) @[CircularPointerFifo.scala 26:24]
    reg wrPtr : UInt<11>, clock with :
      reset => (UInt<1>("h0"), wrPtr) @[CircularPointerFifo.scala 29:22]
    node _wrPtr_T = add(wrPtr, io_push) @[CircularPointerFifo.scala 30:18]
    node _wrPtr_T_1 = tail(_wrPtr_T, 1) @[CircularPointerFifo.scala 30:18]
    reg rdPtr : UInt<11>, clock with :
      reset => (UInt<1>("h0"), rdPtr) @[CircularPointerFifo.scala 32:22]
    node _rdPtr_T = add(rdPtr, io_pop) @[CircularPointerFifo.scala 33:18]
    node _rdPtr_T_1 = tail(_rdPtr_T, 1) @[CircularPointerFifo.scala 33:18]
    node _io_empty_T = eq(cnt, UInt<1>("h0")) @[CircularPointerFifo.scala 35:19]
    node _io_full_T = eq(cnt, UInt<12>("h800")) @[CircularPointerFifo.scala 36:18]
    node input_data = mux(io_push, io_data_in, entries.input_data_MPORT.data) @[CircularPointerFifo.scala 39:23]
    io_full <= _io_full_T @[CircularPointerFifo.scala 36:11]
    io_empty <= _io_empty_T @[CircularPointerFifo.scala 35:12]
    io_data_out <= entries.io_data_out_MPORT.data @[CircularPointerFifo.scala 43:17]
    cnt <= mux(reset, UInt<12>("h0"), _cnt_T_3) @[CircularPointerFifo.scala 25:{20,20} 26:7]
    wrPtr <= mux(reset, UInt<11>("h0"), _wrPtr_T_1) @[CircularPointerFifo.scala 29:{22,22} 30:9]
    rdPtr <= mux(reset, UInt<11>("h0"), _rdPtr_T_1) @[CircularPointerFifo.scala 32:{22,22} 33:9]
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

    reg credits : UInt<12>, clock with :
      reset => (UInt<1>("h0"), credits) @[ArbitratedTop.scala 73:24]
    node _credits_T = add(credits, inc) @[ArbitratedTop.scala 74:22]
    node _credits_T_1 = tail(_credits_T, 1) @[ArbitratedTop.scala 74:22]
    node _credits_T_2 = sub(_credits_T_1, dec) @[ArbitratedTop.scala 74:28]
    node _credits_T_3 = tail(_credits_T_2, 1) @[ArbitratedTop.scala 74:28]
    node _has_credits_T = gt(credits, UInt<1>("h0")) @[ArbitratedTop.scala 75:26]
    node _T = neq(credits, UInt<12>("h800")) @[ArbitratedTop.scala 78:18]
    node _T_1 = eq(inc, UInt<1>("h0")) @[ArbitratedTop.scala 78:38]
    node _T_2 = or(_T, _T_1) @[ArbitratedTop.scala 78:35]
    node _T_3 = asUInt(reset) @[ArbitratedTop.scala 78:9]
    node _T_4 = eq(_T_3, UInt<1>("h0")) @[ArbitratedTop.scala 78:9]
    node _T_5 = eq(_T_2, UInt<1>("h0")) @[ArbitratedTop.scala 78:9]
    node _creditIsMax_T = eq(credits, UInt<12>("h800")) @[ArbitratedTop.scala 84:26]
    has_credits <= _has_credits_T @[ArbitratedTop.scala 75:15]
    creditIsMax <= _creditIsMax_T @[ArbitratedTop.scala 84:15]
    credits <= mux(reset, UInt<12>("h801"), _credits_T_3) @[ArbitratedTop.scala 73:{24,24} 74:11]
    printf(clock, and(and(and(UInt<1>("h1"), _T_4), _T_5), UInt<1>("h1")), "Assumption failed\n    at ArbitratedTop.scala:78 assume(credits =/= creditsMax.U || !inc)\n") : printf @[ArbitratedTop.scala 78:9]
    assert(clock, _T_2, and(and(UInt<1>("h1"), _T_4), UInt<1>("h1")), "") : assume @[ArbitratedTop.scala 78:9]

  module ArbitratedTop :
    input clock : Clock
    input reset : UInt<1>
    input io_push_0 : UInt<1>
    input io_push_1 : UInt<1>
    input io_push_2 : UInt<1>
    input io_data_in_0 : UInt<64>
    input io_data_in_1 : UInt<64>
    input io_data_in_2 : UInt<64>
    input io_req : UInt<1>
    input io_gnt_sel : UInt<2>
    output io_data_out : UInt<64>
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
    node _T_2 = bits(reset, 0, 0) @[ArbitratedTop.scala 54:11]
    node _T_3 = eq(_T_2, UInt<1>("h0")) @[ArbitratedTop.scala 54:11]
    node _T_4 = eq(_T_1, UInt<1>("h0")) @[ArbitratedTop.scala 54:11]
    node _T_5 = eq(empty_0, UInt<1>("h0")) @[ArbitratedTop.scala 56:12]
    node _T_6 = eq(io_gnt_0, UInt<1>("h0")) @[ArbitratedTop.scala 56:26]
    node _T_7 = or(_T_5, _T_6) @[ArbitratedTop.scala 56:23]
    node _T_8 = bits(reset, 0, 0) @[ArbitratedTop.scala 56:11]
    node _T_9 = eq(_T_8, UInt<1>("h0")) @[ArbitratedTop.scala 56:11]
    node _T_10 = eq(_T_7, UInt<1>("h0")) @[ArbitratedTop.scala 56:11]
    node _T_11 = eq(io_push_1, UInt<1>("h0")) @[ArbitratedTop.scala 54:30]
    node _T_12 = or(has_credit_1, _T_11) @[ArbitratedTop.scala 54:27]
    node _T_13 = bits(reset, 0, 0) @[ArbitratedTop.scala 54:11]
    node _T_14 = eq(_T_13, UInt<1>("h0")) @[ArbitratedTop.scala 54:11]
    node _T_15 = eq(_T_12, UInt<1>("h0")) @[ArbitratedTop.scala 54:11]
    node _T_16 = eq(empty_1, UInt<1>("h0")) @[ArbitratedTop.scala 56:12]
    node _T_17 = eq(io_gnt_1, UInt<1>("h0")) @[ArbitratedTop.scala 56:26]
    node _T_18 = or(_T_16, _T_17) @[ArbitratedTop.scala 56:23]
    node _T_19 = bits(reset, 0, 0) @[ArbitratedTop.scala 56:11]
    node _T_20 = eq(_T_19, UInt<1>("h0")) @[ArbitratedTop.scala 56:11]
    node _T_21 = eq(_T_18, UInt<1>("h0")) @[ArbitratedTop.scala 56:11]
    node _T_22 = eq(io_push_2, UInt<1>("h0")) @[ArbitratedTop.scala 54:30]
    node _T_23 = or(has_credit_2, _T_22) @[ArbitratedTop.scala 54:27]
    node _T_24 = bits(reset, 0, 0) @[ArbitratedTop.scala 54:11]
    node _T_25 = eq(_T_24, UInt<1>("h0")) @[ArbitratedTop.scala 54:11]
    node _T_26 = eq(_T_23, UInt<1>("h0")) @[ArbitratedTop.scala 54:11]
    node _T_27 = eq(empty_2, UInt<1>("h0")) @[ArbitratedTop.scala 56:12]
    node _T_28 = eq(io_gnt_2, UInt<1>("h0")) @[ArbitratedTop.scala 56:26]
    node _T_29 = or(_T_27, _T_28) @[ArbitratedTop.scala 56:23]
    node _T_30 = bits(reset, 0, 0) @[ArbitratedTop.scala 56:11]
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
