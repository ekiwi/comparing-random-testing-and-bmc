circuit FifoFormalHarness :
  module ShiftRegisterFifo :
    input clock : Clock
    input reset : UInt<1>
    input io_push : UInt<1>
    input io_pop : UInt<1>
    input io_data_in : UInt<8>
    output io_full : UInt<1>
    output io_empty : UInt<1>
    output io_data_out : UInt<8>

    reg count : UInt<4>, clock with :
      reset => (UInt<1>("h0"), count) @[ShiftRegisterFifo.scala 14:22]
    node _count_T = add(count, io_push) @[ShiftRegisterFifo.scala 15:18]
    node _count_T_1 = tail(_count_T, 1) @[ShiftRegisterFifo.scala 15:18]
    node _count_T_2 = sub(_count_T_1, io_pop) @[ShiftRegisterFifo.scala 15:28]
    node _count_T_3 = tail(_count_T_2, 1) @[ShiftRegisterFifo.scala 15:28]
    node _io_empty_T = eq(count, UInt<1>("h0")) @[ShiftRegisterFifo.scala 17:21]
    node _io_full_T = geq(count, UInt<4>("h8")) @[ShiftRegisterFifo.scala 18:20]
    reg entries_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), entries_0) @[ShiftRegisterFifo.scala 22:22]
    node _entries_T = eq(count, UInt<1>("h0")) @[ShiftRegisterFifo.scala 23:39]
    node _entries_T_1 = and(io_push, _entries_T) @[ShiftRegisterFifo.scala 23:29]
    node _entries_T_2 = or(io_pop, _entries_T_1) @[ShiftRegisterFifo.scala 23:17]
    node _next_value_0_T = sub(count, io_pop) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_0_T_1 = tail(_next_value_0_T, 1) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_0_T_2 = eq(_next_value_0_T_1, UInt<1>("h0")) @[ShiftRegisterFifo.scala 33:45]
    node _next_value_0_T_3 = and(io_push, _next_value_0_T_2) @[ShiftRegisterFifo.scala 33:25]
    reg entries_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), entries_1) @[ShiftRegisterFifo.scala 22:22]
    node not_pushed = mux(io_pop, entries_1, UInt<1>("h0")) @[ShiftRegisterFifo.scala 32:49]
    node _next_value_0_T_4 = mux(_next_value_0_T_3, io_data_in, not_pushed) @[ShiftRegisterFifo.scala 33:16]
    node next_value_0 = _next_value_0_T_4 @[ShiftRegisterFifo.scala 20:40 33:10]
    node _GEN_0 = mux(_entries_T_2, next_value_0, entries_0) @[ShiftRegisterFifo.scala 23:51 24:11 22:22]
    node _entries_T_3 = eq(count, UInt<1>("h1")) @[ShiftRegisterFifo.scala 23:39]
    node _entries_T_4 = and(io_push, _entries_T_3) @[ShiftRegisterFifo.scala 23:29]
    node _entries_T_5 = or(io_pop, _entries_T_4) @[ShiftRegisterFifo.scala 23:17]
    node _next_value_1_T = sub(count, io_pop) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_1_T_1 = tail(_next_value_1_T, 1) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_1_T_2 = eq(_next_value_1_T_1, UInt<1>("h1")) @[ShiftRegisterFifo.scala 33:45]
    node _next_value_1_T_3 = and(io_push, _next_value_1_T_2) @[ShiftRegisterFifo.scala 33:25]
    reg entries_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), entries_2) @[ShiftRegisterFifo.scala 22:22]
    node not_pushed_1 = mux(io_pop, entries_2, UInt<1>("h0")) @[ShiftRegisterFifo.scala 32:49]
    node _next_value_1_T_4 = mux(_next_value_1_T_3, io_data_in, not_pushed_1) @[ShiftRegisterFifo.scala 33:16]
    node next_value_1 = _next_value_1_T_4 @[ShiftRegisterFifo.scala 20:40 33:10]
    node _GEN_1 = mux(_entries_T_5, next_value_1, entries_1) @[ShiftRegisterFifo.scala 23:51 24:11 22:22]
    node _entries_T_6 = eq(count, UInt<2>("h2")) @[ShiftRegisterFifo.scala 23:39]
    node _entries_T_7 = and(io_push, _entries_T_6) @[ShiftRegisterFifo.scala 23:29]
    node _entries_T_8 = or(io_pop, _entries_T_7) @[ShiftRegisterFifo.scala 23:17]
    node _next_value_2_T = sub(count, io_pop) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_2_T_1 = tail(_next_value_2_T, 1) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_2_T_2 = eq(_next_value_2_T_1, UInt<2>("h2")) @[ShiftRegisterFifo.scala 33:45]
    node _next_value_2_T_3 = and(io_push, _next_value_2_T_2) @[ShiftRegisterFifo.scala 33:25]
    reg entries_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), entries_3) @[ShiftRegisterFifo.scala 22:22]
    node not_pushed_2 = mux(io_pop, entries_3, UInt<1>("h0")) @[ShiftRegisterFifo.scala 32:49]
    node _next_value_2_T_4 = mux(_next_value_2_T_3, io_data_in, not_pushed_2) @[ShiftRegisterFifo.scala 33:16]
    node next_value_2 = _next_value_2_T_4 @[ShiftRegisterFifo.scala 20:40 33:10]
    node _GEN_2 = mux(_entries_T_8, next_value_2, entries_2) @[ShiftRegisterFifo.scala 23:51 24:11 22:22]
    node _entries_T_9 = eq(count, UInt<2>("h3")) @[ShiftRegisterFifo.scala 23:39]
    node _entries_T_10 = and(io_push, _entries_T_9) @[ShiftRegisterFifo.scala 23:29]
    node _entries_T_11 = or(io_pop, _entries_T_10) @[ShiftRegisterFifo.scala 23:17]
    node _next_value_3_T = sub(count, io_pop) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_3_T_1 = tail(_next_value_3_T, 1) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_3_T_2 = eq(_next_value_3_T_1, UInt<2>("h3")) @[ShiftRegisterFifo.scala 33:45]
    node _next_value_3_T_3 = and(io_push, _next_value_3_T_2) @[ShiftRegisterFifo.scala 33:25]
    reg entries_4 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), entries_4) @[ShiftRegisterFifo.scala 22:22]
    node not_pushed_3 = mux(io_pop, entries_4, UInt<1>("h0")) @[ShiftRegisterFifo.scala 32:49]
    node _next_value_3_T_4 = mux(_next_value_3_T_3, io_data_in, not_pushed_3) @[ShiftRegisterFifo.scala 33:16]
    node next_value_3 = _next_value_3_T_4 @[ShiftRegisterFifo.scala 20:40 33:10]
    node _GEN_3 = mux(_entries_T_11, next_value_3, entries_3) @[ShiftRegisterFifo.scala 23:51 24:11 22:22]
    node _entries_T_12 = eq(count, UInt<3>("h4")) @[ShiftRegisterFifo.scala 23:39]
    node _entries_T_13 = and(io_push, _entries_T_12) @[ShiftRegisterFifo.scala 23:29]
    node _entries_T_14 = or(io_pop, _entries_T_13) @[ShiftRegisterFifo.scala 23:17]
    node _next_value_4_T = sub(count, io_pop) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_4_T_1 = tail(_next_value_4_T, 1) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_4_T_2 = eq(_next_value_4_T_1, UInt<3>("h4")) @[ShiftRegisterFifo.scala 33:45]
    node _next_value_4_T_3 = and(io_push, _next_value_4_T_2) @[ShiftRegisterFifo.scala 33:25]
    reg entries_5 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), entries_5) @[ShiftRegisterFifo.scala 22:22]
    node not_pushed_4 = mux(io_pop, entries_5, UInt<1>("h0")) @[ShiftRegisterFifo.scala 32:49]
    node _next_value_4_T_4 = mux(_next_value_4_T_3, io_data_in, not_pushed_4) @[ShiftRegisterFifo.scala 33:16]
    node next_value_4 = _next_value_4_T_4 @[ShiftRegisterFifo.scala 20:40 33:10]
    node _GEN_4 = mux(_entries_T_14, next_value_4, entries_4) @[ShiftRegisterFifo.scala 23:51 24:11 22:22]
    node _entries_T_15 = eq(count, UInt<3>("h5")) @[ShiftRegisterFifo.scala 23:39]
    node _entries_T_16 = and(io_push, _entries_T_15) @[ShiftRegisterFifo.scala 23:29]
    node _entries_T_17 = or(io_pop, _entries_T_16) @[ShiftRegisterFifo.scala 23:17]
    node _next_value_5_T = sub(count, io_pop) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_5_T_1 = tail(_next_value_5_T, 1) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_5_T_2 = eq(_next_value_5_T_1, UInt<3>("h5")) @[ShiftRegisterFifo.scala 33:45]
    node _next_value_5_T_3 = and(io_push, _next_value_5_T_2) @[ShiftRegisterFifo.scala 33:25]
    reg entries_6 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), entries_6) @[ShiftRegisterFifo.scala 22:22]
    node not_pushed_5 = mux(io_pop, entries_6, UInt<1>("h0")) @[ShiftRegisterFifo.scala 32:49]
    node _next_value_5_T_4 = mux(_next_value_5_T_3, io_data_in, not_pushed_5) @[ShiftRegisterFifo.scala 33:16]
    node next_value_5 = _next_value_5_T_4 @[ShiftRegisterFifo.scala 20:40 33:10]
    node _GEN_5 = mux(_entries_T_17, next_value_5, entries_5) @[ShiftRegisterFifo.scala 23:51 24:11 22:22]
    node _entries_T_18 = eq(count, UInt<3>("h6")) @[ShiftRegisterFifo.scala 23:39]
    node _entries_T_19 = and(io_push, _entries_T_18) @[ShiftRegisterFifo.scala 23:29]
    node _entries_T_20 = or(io_pop, _entries_T_19) @[ShiftRegisterFifo.scala 23:17]
    node _next_value_6_T = sub(count, io_pop) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_6_T_1 = tail(_next_value_6_T, 1) @[ShiftRegisterFifo.scala 33:35]
    node _next_value_6_T_2 = eq(_next_value_6_T_1, UInt<3>("h6")) @[ShiftRegisterFifo.scala 33:45]
    node _next_value_6_T_3 = and(io_push, _next_value_6_T_2) @[ShiftRegisterFifo.scala 33:25]
    reg entries_7 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), entries_7) @[ShiftRegisterFifo.scala 22:22]
    node not_pushed_6 = mux(io_pop, entries_7, UInt<1>("h0")) @[ShiftRegisterFifo.scala 32:49]
    node _next_value_6_T_4 = mux(_next_value_6_T_3, io_data_in, not_pushed_6) @[ShiftRegisterFifo.scala 33:16]
    node next_value_6 = _next_value_6_T_4 @[ShiftRegisterFifo.scala 20:40 33:10]
    node _GEN_6 = mux(_entries_T_20, next_value_6, entries_6) @[ShiftRegisterFifo.scala 23:51 24:11 22:22]
    node _entries_T_21 = eq(count, UInt<3>("h7")) @[ShiftRegisterFifo.scala 23:39]
    node _entries_T_22 = and(io_push, _entries_T_21) @[ShiftRegisterFifo.scala 23:29]
    node _entries_T_23 = or(io_pop, _entries_T_22) @[ShiftRegisterFifo.scala 23:17]
    node next_value_7 = validif(UInt<1>("h0"), UInt<8>("h0"))
    node _GEN_7 = mux(_entries_T_23, next_value_7, entries_7) @[ShiftRegisterFifo.scala 23:51 24:11 22:22]
    io_full <= _io_full_T @[ShiftRegisterFifo.scala 18:11]
    io_empty <= _io_empty_T @[ShiftRegisterFifo.scala 17:12]
    io_data_out <= entries_0 @[ShiftRegisterFifo.scala 36:15]
    count <= mux(reset, UInt<4>("h0"), _count_T_3) @[ShiftRegisterFifo.scala 14:{22,22} 15:9]
    entries_0 <= mux(reset, UInt<8>("h0"), _GEN_0) @[ShiftRegisterFifo.scala 22:{22,22}]
    entries_1 <= mux(reset, UInt<8>("h0"), _GEN_1) @[ShiftRegisterFifo.scala 22:{22,22}]
    entries_2 <= mux(reset, UInt<8>("h0"), _GEN_2) @[ShiftRegisterFifo.scala 22:{22,22}]
    entries_3 <= mux(reset, UInt<8>("h0"), _GEN_3) @[ShiftRegisterFifo.scala 22:{22,22}]
    entries_4 <= mux(reset, UInt<8>("h0"), _GEN_4) @[ShiftRegisterFifo.scala 22:{22,22}]
    entries_5 <= mux(reset, UInt<8>("h0"), _GEN_5) @[ShiftRegisterFifo.scala 22:{22,22}]
    entries_6 <= mux(reset, UInt<8>("h0"), _GEN_6) @[ShiftRegisterFifo.scala 22:{22,22}]
    entries_7 <= mux(reset, UInt<8>("h0"), _GEN_7) @[ShiftRegisterFifo.scala 22:{22,22}]

  module MagicPacketTracker :
    input clock : Clock
    input reset : UInt<1>
    input enq_valid : UInt<1>
    input enq_bits : UInt<8>
    input deq_valid : UInt<1>
    input deq_bits : UInt<8>
    input startTracking : UInt<1>

    reg elementCount : UInt<5>, clock with :
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
    reg packetValue : UInt<8>, clock with :
      reset => (UInt<1>("h0"), packetValue) @[MagicPacketTracker.scala 56:24]
    reg packetCount : UInt<5>, clock with :
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
    node _T_15 = eq(elementCount, UInt<5>("h10")) @[MagicPacketTracker.scala 88:21]
    node _shouldIncrement_T = eq(deq_valid, UInt<1>("h0")) @[MagicPacketTracker.scala 89:39]
    node shouldIncrement = and(enq_valid, _shouldIncrement_T) @[MagicPacketTracker.scala 89:36]
    node _T_16 = eq(shouldIncrement, UInt<1>("h0")) @[MagicPacketTracker.scala 91:7]
    node _T_17 = asUInt(reset) @[MagicPacketTracker.scala 90:11]
    node _T_18 = eq(_T_17, UInt<1>("h0")) @[MagicPacketTracker.scala 90:11]
    node _T_19 = eq(_T_16, UInt<1>("h0")) @[MagicPacketTracker.scala 90:11]
    elementCount <= mux(reset, UInt<5>("h0"), nextElementCount) @[MagicPacketTracker.scala 45:{29,29} 51:16]
    isActive <= mux(reset, UInt<1>("h0"), _GEN_8) @[MagicPacketTracker.scala 55:{25,25}]
    packetValue <= _GEN_4
    packetCount <= _GEN_7
    printf(clock, and(and(and(and(and(UInt<1>("h1"), _T_2), _T_4), _T_7), _T_8), UInt<1>("h1")), "Assertion failed: element should pass through the fifo, but %x != %x\n    at MagicPacketTracker.scala:61 assert(\n", enq_bits, deq_bits) : printf @[MagicPacketTracker.scala 61:13]
    assert(clock, _T_5, and(and(and(and(UInt<1>("h1"), _T_2), _T_4), _T_7), UInt<1>("h1")), "") : assert @[MagicPacketTracker.scala 61:13]
    printf(clock, and(and(and(and(and(UInt<1>("h1"), _T_9), _T_10), _T_13), _T_14), UInt<1>("h1")), "Assertion failed: element should be dequeued in this cycle, but %x != %x\n    at MagicPacketTracker.scala:77 assert(\n", packetValue, deq_bits) : printf_1 @[MagicPacketTracker.scala 77:13]
    assert(clock, _T_11, and(and(and(and(UInt<1>("h1"), _T_9), _T_10), _T_13), UInt<1>("h1")), "") : assert_1 @[MagicPacketTracker.scala 77:13]
    printf(clock, and(and(and(and(UInt<1>("h1"), _T_15), _T_18), _T_19), UInt<1>("h1")), "Assertion failed: MagicPacketTracker: element counter is overflowing %d -> %d\nThis could indicate either a bug in your FIFO design, or an insufficient depth provided to the MagicPacketTracker constructor.\n    at MagicPacketTracker.scala:90 assert(\n", elementCount, nextElementCount) : printf_2 @[MagicPacketTracker.scala 90:11]
    assert(clock, _T_16, and(and(and(UInt<1>("h1"), _T_15), _T_18), UInt<1>("h1")), "") : assert_2 @[MagicPacketTracker.scala 90:11]

  module FifoFormalHarness :
    input clock : Clock
    input reset : UInt<1>
    output enq_ready : UInt<1>
    input enq_valid : UInt<1>
    input enq_bits : UInt<8>
    input deq_ready : UInt<1>
    output deq_valid : UInt<1>
    output deq_bits : UInt<8>
    input startTracking : UInt<1>

    inst dut of ShiftRegisterFifo @[FifoFormalHarness.scala 9:19]
    inst tracker of MagicPacketTracker @[MagicPacketTracker.scala 18:25]
    node _enq_ready_T = eq(dut.io_full, UInt<1>("h0")) @[FifoFormalHarness.scala 12:16]
    node _dut_io_push_T = and(enq_ready, enq_valid) @[Decoupled.scala 50:35]
    node _deq_valid_T = eq(dut.io_empty, UInt<1>("h0")) @[FifoFormalHarness.scala 16:16]
    node _dut_io_pop_T = and(deq_ready, deq_valid) @[Decoupled.scala 50:35]
    node _validIO_valid_T = and(enq_ready, enq_valid) @[Decoupled.scala 50:35]
    node _validIO_valid_T_1 = and(deq_ready, deq_valid) @[Decoupled.scala 50:35]
    node validIO_valid = _validIO_valid_T @[MagicPacketTracker.scala 32:23 33:19]
    node validIO_bits = enq_bits @[MagicPacketTracker.scala 32:23 34:18]
    node validIO_1_valid = _validIO_valid_T_1 @[MagicPacketTracker.scala 32:23 33:19]
    node validIO_1_bits = deq_bits @[MagicPacketTracker.scala 32:23 34:18]
    enq_ready <= _enq_ready_T @[FifoFormalHarness.scala 12:13]
    deq_valid <= _deq_valid_T @[FifoFormalHarness.scala 16:13]
    deq_bits <= dut.io_data_out @[FifoFormalHarness.scala 15:12]
    dut.clock <= clock
    dut.reset <= reset
    dut.io_push <= _dut_io_push_T @[FifoFormalHarness.scala 13:15]
    dut.io_pop <= _dut_io_pop_T @[FifoFormalHarness.scala 17:14]
    dut.io_data_in <= enq_bits @[FifoFormalHarness.scala 11:18]
    tracker.clock <= clock
    tracker.reset <= reset
    tracker.enq_valid <= validIO_valid @[MagicPacketTracker.scala 19:17]
    tracker.enq_bits <= validIO_bits @[MagicPacketTracker.scala 19:17]
    tracker.deq_valid <= validIO_1_valid @[MagicPacketTracker.scala 20:17]
    tracker.deq_bits <= validIO_1_bits @[MagicPacketTracker.scala 20:17]
    tracker.startTracking <= startTracking @[MagicPacketTracker.scala 22:27]
