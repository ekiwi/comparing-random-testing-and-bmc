circuit ArbitratedFormalHarness :
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
      depth => 64
      read-latency => 0
      write-latency => 1
      reader => input_data_MPORT
      reader => io_data_out_MPORT
      writer => MPORT
      read-under-write => undefined
    reg cnt : UInt<7>, clock with :
      reset => (UInt<1>("h0"), cnt) @[CircularPointerFifo.scala 25:20]
    node _cnt_T = add(cnt, io_push) @[CircularPointerFifo.scala 26:14]
    node _cnt_T_1 = tail(_cnt_T, 1) @[CircularPointerFifo.scala 26:14]
    node _cnt_T_2 = sub(_cnt_T_1, io_pop) @[CircularPointerFifo.scala 26:24]
    node _cnt_T_3 = tail(_cnt_T_2, 1) @[CircularPointerFifo.scala 26:24]
    reg wrPtr : UInt<6>, clock with :
      reset => (UInt<1>("h0"), wrPtr) @[CircularPointerFifo.scala 29:22]
    node _wrPtr_T = add(wrPtr, io_push) @[CircularPointerFifo.scala 30:18]
    node _wrPtr_T_1 = tail(_wrPtr_T, 1) @[CircularPointerFifo.scala 30:18]
    reg rdPtr : UInt<6>, clock with :
      reset => (UInt<1>("h0"), rdPtr) @[CircularPointerFifo.scala 32:22]
    node _rdPtr_T = add(rdPtr, io_pop) @[CircularPointerFifo.scala 33:18]
    node _rdPtr_T_1 = tail(_rdPtr_T, 1) @[CircularPointerFifo.scala 33:18]
    node _io_empty_T = eq(cnt, UInt<1>("h0")) @[CircularPointerFifo.scala 35:19]
    node _io_full_T = eq(cnt, UInt<7>("h40")) @[CircularPointerFifo.scala 36:18]
    node input_data = mux(io_push, io_data_in, entries.input_data_MPORT.data) @[CircularPointerFifo.scala 39:23]
    io_full <= _io_full_T @[CircularPointerFifo.scala 36:11]
    io_empty <= _io_empty_T @[CircularPointerFifo.scala 35:12]
    io_data_out <= entries.io_data_out_MPORT.data @[CircularPointerFifo.scala 43:17]
    cnt <= mux(reset, UInt<7>("h0"), _cnt_T_3) @[CircularPointerFifo.scala 25:{20,20} 26:7]
    wrPtr <= mux(reset, UInt<6>("h0"), _wrPtr_T_1) @[CircularPointerFifo.scala 29:{22,22} 30:9]
    rdPtr <= mux(reset, UInt<6>("h0"), _rdPtr_T_1) @[CircularPointerFifo.scala 32:{22,22} 33:9]
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

    reg credits : UInt<7>, clock with :
      reset => (UInt<1>("h0"), credits) @[ArbitratedTop.scala 73:24]
    node _credits_T = add(credits, inc) @[ArbitratedTop.scala 74:22]
    node _credits_T_1 = tail(_credits_T, 1) @[ArbitratedTop.scala 74:22]
    node _credits_T_2 = sub(_credits_T_1, dec) @[ArbitratedTop.scala 74:28]
    node _credits_T_3 = tail(_credits_T_2, 1) @[ArbitratedTop.scala 74:28]
    node _has_credits_T = gt(credits, UInt<1>("h0")) @[ArbitratedTop.scala 75:26]
    node _T = neq(credits, UInt<7>("h40")) @[ArbitratedTop.scala 78:18]
    node _T_1 = eq(inc, UInt<1>("h0")) @[ArbitratedTop.scala 78:38]
    node _T_2 = or(_T, _T_1) @[ArbitratedTop.scala 78:35]
    node _T_3 = asUInt(reset) @[ArbitratedTop.scala 78:9]
    node _T_4 = eq(_T_3, UInt<1>("h0")) @[ArbitratedTop.scala 78:9]
    node _T_5 = eq(_T_2, UInt<1>("h0")) @[ArbitratedTop.scala 78:9]
    node _creditIsMax_T = eq(credits, UInt<7>("h40")) @[ArbitratedTop.scala 84:26]
    has_credits <= _has_credits_T @[ArbitratedTop.scala 75:15]
    creditIsMax <= _creditIsMax_T @[ArbitratedTop.scala 84:15]
    credits <= mux(reset, UInt<7>("h41"), _credits_T_3) @[ArbitratedTop.scala 73:{24,24} 74:11]
    printf(clock, and(and(and(UInt<1>("h1"), _T_4), _T_5), UInt<1>("h1")), "Assumption failed\n    at ArbitratedTop.scala:78 assume(credits =/= creditsMax.U || !inc)\n") : printf @[ArbitratedTop.scala 78:9]
    assume(clock, _T_2, and(and(UInt<1>("h1"), _T_4), UInt<1>("h1")), "") : assume @[ArbitratedTop.scala 78:9]

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

  module MagicPacketTracker :
    input clock : Clock
    input reset : UInt<1>
    input enq_valid : UInt<1>
    input enq_bits : UInt<64>
    input deq_valid : UInt<1>
    input deq_bits : UInt<64>
    input startTracking : UInt<1>

    reg elementCount : UInt<7>, clock with :
      reset => (UInt<1>("h0"), elementCount) @[MagicPacketTracker.scala 45:29]
    node _nextElementCount_T = eq(deq_valid, UInt<1>("h0")) @[MagicPacketTracker.scala 47:17]
    node _nextElementCount_T_1 = and(enq_valid, _nextElementCount_T) @[MagicPacketTracker.scala 47:14]
    node _nextElementCount_T_2 = add(elementCount, UInt<1>("h1")) @[MagicPacketTracker.scala 48:18]
    node _nextElementCount_T_3 = tail(_nextElementCount_T_2, 1) @[MagicPacketTracker.scala 48:18]
    node _nextElementCount_T_4 = eq(enq_valid, UInt<1>("h0")) @[MagicPacketTracker.scala 49:9]
    node _nextElementCount_T_5 = and(_nextElementCount_T_4, deq_valid) @[MagicPacketTracker.scala 49:19]
    node _nextElementCount_T_6 = sub(elementCount, UInt<1>("h1")) @[MagicPacketTracker.scala 49:45]
    node _nextElementCount_T_7 = tail(_nextElementCount_T_6, 1) @[MagicPacketTracker.scala 49:45]
    node _nextElementCount_T_8 = mux(_nextElementCount_T_5, _nextElementCount_T_7, elementCount) @[MagicPacketTracker.scala 49:8]
    node nextElementCount = mux(_nextElementCount_T_1, _nextElementCount_T_3, _nextElementCount_T_8) @[MagicPacketTracker.scala 46:29]
    reg isActive : UInt<1>, clock with :
      reset => (UInt<1>("h0"), isActive) @[MagicPacketTracker.scala 55:25]
    reg packetValue : UInt<64>, clock with :
      reset => (UInt<1>("h0"), packetValue) @[MagicPacketTracker.scala 56:24]
    reg packetCount : UInt<7>, clock with :
      reset => (UInt<1>("h0"), packetCount) @[MagicPacketTracker.scala 57:24]
    node _T = eq(isActive, UInt<1>("h0")) @[MagicPacketTracker.scala 59:8]
    node _T_1 = and(_T, enq_valid) @[MagicPacketTracker.scala 59:18]
    node _T_2 = and(_T_1, startTracking) @[MagicPacketTracker.scala 59:30]
    node _T_3 = eq(elementCount, UInt<1>("h0")) @[MagicPacketTracker.scala 60:35]
    node _T_4 = and(deq_valid, _T_3) @[MagicPacketTracker.scala 60:19]
    node _T_5 = eq(enq_bits, deq_bits) @[MagicPacketTracker.scala 62:25]
    node _T_6 = asUInt(reset) @[MagicPacketTracker.scala 61:13]
    node _T_7 = eq(_T_6, UInt<1>("h0")) @[MagicPacketTracker.scala 61:13]
    node _T_8 = eq(_T_5, UInt<1>("h0")) @[MagicPacketTracker.scala 61:13]
    node _GEN_0 = mux(_T_4, isActive, UInt<1>("h1")) @[MagicPacketTracker.scala 55:25 60:44 68:16]
    node _GEN_1 = mux(_T_4, packetValue, enq_bits) @[MagicPacketTracker.scala 56:24 60:44 69:19]
    node _GEN_2 = mux(_T_4, packetCount, nextElementCount) @[MagicPacketTracker.scala 57:24 60:44 70:19]
    node _GEN_3 = mux(_T_2, _GEN_0, isActive) @[MagicPacketTracker.scala 55:25 59:48]
    node _GEN_4 = mux(_T_2, _GEN_1, packetValue) @[MagicPacketTracker.scala 56:24 59:48]
    node _GEN_5 = mux(_T_2, _GEN_2, packetCount) @[MagicPacketTracker.scala 57:24 59:48]
    node _T_9 = and(isActive, deq_valid) @[MagicPacketTracker.scala 74:17]
    node _packetCount_T = sub(packetCount, UInt<1>("h1")) @[MagicPacketTracker.scala 75:32]
    node _packetCount_T_1 = tail(_packetCount_T, 1) @[MagicPacketTracker.scala 75:32]
    node _T_10 = eq(packetCount, UInt<1>("h1")) @[MagicPacketTracker.scala 76:22]
    node _T_11 = eq(packetValue, deq_bits) @[MagicPacketTracker.scala 78:28]
    node _T_12 = asUInt(reset) @[MagicPacketTracker.scala 77:13]
    node _T_13 = eq(_T_12, UInt<1>("h0")) @[MagicPacketTracker.scala 77:13]
    node _T_14 = eq(_T_11, UInt<1>("h0")) @[MagicPacketTracker.scala 77:13]
    node _GEN_6 = mux(_T_10, UInt<1>("h0"), _GEN_3) @[MagicPacketTracker.scala 76:31 83:16]
    node _GEN_7 = mux(_T_9, _packetCount_T_1, _GEN_5) @[MagicPacketTracker.scala 74:30 75:17]
    node _GEN_8 = mux(_T_9, _GEN_6, _GEN_3) @[MagicPacketTracker.scala 74:30]
    node _T_15 = eq(elementCount, UInt<7>("h42")) @[MagicPacketTracker.scala 88:21]
    node _shouldIncrement_T = eq(deq_valid, UInt<1>("h0")) @[MagicPacketTracker.scala 89:39]
    node shouldIncrement = and(enq_valid, _shouldIncrement_T) @[MagicPacketTracker.scala 89:36]
    node _T_16 = eq(shouldIncrement, UInt<1>("h0")) @[MagicPacketTracker.scala 91:7]
    node _T_17 = asUInt(reset) @[MagicPacketTracker.scala 90:11]
    node _T_18 = eq(_T_17, UInt<1>("h0")) @[MagicPacketTracker.scala 90:11]
    node _T_19 = eq(_T_16, UInt<1>("h0")) @[MagicPacketTracker.scala 90:11]
    elementCount <= mux(reset, UInt<7>("h0"), nextElementCount) @[MagicPacketTracker.scala 45:{29,29} 51:16]
    isActive <= mux(reset, UInt<1>("h0"), _GEN_8) @[MagicPacketTracker.scala 55:{25,25}]
    packetValue <= _GEN_4
    packetCount <= _GEN_7
    printf(clock, and(and(and(and(and(UInt<1>("h1"), _T_2), _T_4), _T_7), _T_8), UInt<1>("h1")), "Assertion failed: element should pass through the fifo, but %x != %x\n    at MagicPacketTracker.scala:61 assert(\n", enq_bits, deq_bits) : printf @[MagicPacketTracker.scala 61:13]
    assert(clock, _T_5, and(and(and(and(UInt<1>("h1"), _T_2), _T_4), _T_7), UInt<1>("h1")), "") : assert @[MagicPacketTracker.scala 61:13]
    printf(clock, and(and(and(and(and(UInt<1>("h1"), _T_9), _T_10), _T_13), _T_14), UInt<1>("h1")), "Assertion failed: element should be dequeued in this cycle, but %x != %x\n    at MagicPacketTracker.scala:77 assert(\n", packetValue, deq_bits) : printf_1 @[MagicPacketTracker.scala 77:13]
    assert(clock, _T_11, and(and(and(and(UInt<1>("h1"), _T_9), _T_10), _T_13), UInt<1>("h1")), "") : assert_1 @[MagicPacketTracker.scala 77:13]
    printf(clock, and(and(and(and(UInt<1>("h1"), _T_15), _T_18), _T_19), UInt<1>("h1")), "Assertion failed: MagicPacketTracker: element counter is overflowing %d -> %d\nThis could indicate either a bug in your FIFO design, or an insufficient depth provided to the MagicPacketTracker constructor.\n    at MagicPacketTracker.scala:90 assert(\n", elementCount, nextElementCount) : printf_2 @[MagicPacketTracker.scala 90:11]
    assert(clock, _T_16, and(and(and(UInt<1>("h1"), _T_15), _T_18), UInt<1>("h1")), "") : assert_2 @[MagicPacketTracker.scala 90:11]

  module ArbitratedFormalHarness :
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
    input startTracking : UInt<1>

    inst dut of ArbitratedTop @[ArbitratedFormalHarness.scala 9:19]
    inst tracker of MagicPacketTracker @[MagicPacketTracker.scala 18:25]
    node enq_valid = io_push_0 @[ArbitratedFormalHarness.scala 15:17 17:13]
    node enq_bits = io_data_in_0 @[ArbitratedFormalHarness.scala 15:17 18:12]
    node deq_valid = io_gnt_0 @[ArbitratedFormalHarness.scala 16:17 19:13]
    node deq_bits = io_data_out @[ArbitratedFormalHarness.scala 16:17 20:12]
    io_data_out <= dut.io_data_out @[ArbitratedFormalHarness.scala 11:6]
    io_gnt_0 <= dut.io_gnt_0 @[ArbitratedFormalHarness.scala 11:6]
    io_gnt_1 <= dut.io_gnt_1 @[ArbitratedFormalHarness.scala 11:6]
    io_gnt_2 <= dut.io_gnt_2 @[ArbitratedFormalHarness.scala 11:6]
    dut.clock <= clock
    dut.reset <= reset
    dut.io_push_0 <= io_push_0 @[ArbitratedFormalHarness.scala 11:6]
    dut.io_push_1 <= io_push_1 @[ArbitratedFormalHarness.scala 11:6]
    dut.io_push_2 <= io_push_2 @[ArbitratedFormalHarness.scala 11:6]
    dut.io_data_in_0 <= io_data_in_0 @[ArbitratedFormalHarness.scala 11:6]
    dut.io_data_in_1 <= io_data_in_1 @[ArbitratedFormalHarness.scala 11:6]
    dut.io_data_in_2 <= io_data_in_2 @[ArbitratedFormalHarness.scala 11:6]
    dut.io_req <= io_req @[ArbitratedFormalHarness.scala 11:6]
    dut.io_gnt_sel <= io_gnt_sel @[ArbitratedFormalHarness.scala 11:6]
    tracker.clock <= clock
    tracker.reset <= reset
    tracker.enq_valid <= enq_valid @[MagicPacketTracker.scala 19:17]
    tracker.enq_bits <= enq_bits @[MagicPacketTracker.scala 19:17]
    tracker.deq_valid <= deq_valid @[MagicPacketTracker.scala 20:17]
    tracker.deq_bits <= deq_bits @[MagicPacketTracker.scala 20:17]
    tracker.startTracking <= startTracking @[MagicPacketTracker.scala 22:27]
