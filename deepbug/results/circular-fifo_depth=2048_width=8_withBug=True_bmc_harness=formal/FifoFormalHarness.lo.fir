circuit FifoFormalHarness :
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
      depth => 2049
      read-latency => 0
      write-latency => 1
      reader => input_data_MPORT
      reader => io_data_out_MPORT
      writer => MPORT
      read-under-write => undefined
    reg cnt : UInt<13>, clock with :
      reset => (UInt<1>("h0"), cnt) @[CircularPointerFifo.scala 25:20]
    node _cnt_T = add(cnt, io_push) @[CircularPointerFifo.scala 26:14]
    node _cnt_T_1 = tail(_cnt_T, 1) @[CircularPointerFifo.scala 26:14]
    node _cnt_T_2 = sub(_cnt_T_1, io_pop) @[CircularPointerFifo.scala 26:24]
    node _cnt_T_3 = tail(_cnt_T_2, 1) @[CircularPointerFifo.scala 26:24]
    reg wrPtr : UInt<12>, clock with :
      reset => (UInt<1>("h0"), wrPtr) @[CircularPointerFifo.scala 29:22]
    node _wrPtr_T = add(wrPtr, io_push) @[CircularPointerFifo.scala 30:18]
    node _wrPtr_T_1 = tail(_wrPtr_T, 1) @[CircularPointerFifo.scala 30:18]
    reg rdPtr : UInt<12>, clock with :
      reset => (UInt<1>("h0"), rdPtr) @[CircularPointerFifo.scala 32:22]
    node _rdPtr_T = add(rdPtr, io_pop) @[CircularPointerFifo.scala 33:18]
    node _rdPtr_T_1 = tail(_rdPtr_T, 1) @[CircularPointerFifo.scala 33:18]
    node _io_empty_T = eq(cnt, UInt<1>("h0")) @[CircularPointerFifo.scala 35:19]
    node _io_full_T = eq(cnt, UInt<12>("h801")) @[CircularPointerFifo.scala 36:18]
    node input_data = mux(io_push, io_data_in, entries.input_data_MPORT.data) @[CircularPointerFifo.scala 39:23]
    io_full <= _io_full_T @[CircularPointerFifo.scala 36:11]
    io_empty <= _io_empty_T @[CircularPointerFifo.scala 35:12]
    io_data_out <= entries.io_data_out_MPORT.data @[CircularPointerFifo.scala 43:17]
    cnt <= mux(reset, UInt<13>("h0"), _cnt_T_3) @[CircularPointerFifo.scala 25:{20,20} 26:7]
    wrPtr <= mux(reset, UInt<12>("h0"), _wrPtr_T_1) @[CircularPointerFifo.scala 29:{22,22} 30:9]
    rdPtr <= mux(reset, UInt<12>("h0"), _rdPtr_T_1) @[CircularPointerFifo.scala 32:{22,22} 33:9]
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

  module MagicPacketTracker :
    input clock : Clock
    input reset : UInt<1>
    input enq_valid : UInt<1>
    input enq_bits : UInt<8>
    input deq_valid : UInt<1>
    input deq_bits : UInt<8>
    input startTracking : UInt<1>

    reg elementCount : UInt<13>, clock with :
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
    reg packetCount : UInt<13>, clock with :
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
    node _T_15 = eq(elementCount, UInt<13>("h1000")) @[MagicPacketTracker.scala 88:21]
    node _shouldIncrement_T = eq(deq_valid, UInt<1>("h0")) @[MagicPacketTracker.scala 89:39]
    node shouldIncrement = and(enq_valid, _shouldIncrement_T) @[MagicPacketTracker.scala 89:36]
    node _T_16 = eq(shouldIncrement, UInt<1>("h0")) @[MagicPacketTracker.scala 91:7]
    node _T_17 = asUInt(reset) @[MagicPacketTracker.scala 90:11]
    node _T_18 = eq(_T_17, UInt<1>("h0")) @[MagicPacketTracker.scala 90:11]
    node _T_19 = eq(_T_16, UInt<1>("h0")) @[MagicPacketTracker.scala 90:11]
    elementCount <= mux(reset, UInt<13>("h0"), nextElementCount) @[MagicPacketTracker.scala 45:{29,29} 51:16]
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

    inst dut of CircularPointerFifo @[FifoFormalHarness.scala 9:19]
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
