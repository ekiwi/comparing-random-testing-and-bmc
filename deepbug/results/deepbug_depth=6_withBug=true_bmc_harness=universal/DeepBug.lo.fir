circuit DeepBug :
  module DeepBug :
    input clock : Clock
    input reset : UInt<1>
    input inc_x : UInt<1>
    input inc_y : UInt<1>

    mem valid : @[DeepBug.scala 19:18]
      data-type => UInt<1>
      depth => 64
      read-latency => 0
      write-latency => 1
      reader => en_x
      reader => MPORT_3
      writer => MPORT
      read-under-write => undefined
    mem mem : @[DeepBug.scala 25:16]
      data-type => UInt<64>
      depth => 64
      read-latency => 0
      write-latency => 1
      reader => MPORT_2
      writer => MPORT_1
      read-under-write => undefined
    reg x : UInt<6>, clock with :
      reset => (UInt<1>("h0"), x) @[DeepBug.scala 16:18]
    reg y : UInt<6>, clock with :
      reset => (UInt<1>("h0"), y) @[DeepBug.scala 17:18]
    reg data : UInt<64>, clock with :
      reset => (UInt<1>("h0"), data) @[DeepBug.scala 24:21]
    node _T = and(inc_x, valid.en_x.data) @[DeepBug.scala 28:14]
    node _x_T = add(x, UInt<1>("h1")) @[DeepBug.scala 29:12]
    node _x_T_1 = tail(_x_T, 1) @[DeepBug.scala 29:12]
    node _GEN_0 = mux(_T, _x_T_1, x) @[DeepBug.scala 16:18 28:23 29:7]
    node _y_T = add(y, UInt<1>("h1")) @[DeepBug.scala 32:12]
    node _y_T_1 = tail(_y_T, 1) @[DeepBug.scala 32:12]
    node _T_1 = bits(reset, 0, 0) @[DeepBug.scala 33:17]
    node _T_2 = eq(_T_1, UInt<1>("h0")) @[DeepBug.scala 33:10]
    node _GEN_1 = validif(_T_2, y) @[DeepBug.scala 33:25]
    node _GEN_2 = validif(_T_2, clock) @[DeepBug.scala 33:25]
    node _GEN_3 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[DeepBug.scala 19:18 33:25]
    node _GEN_4 = validif(_T_2, UInt<1>("h1")) @[DeepBug.scala 33:25]
    node _data_T = add(y, UInt<1>("h1")) @[DeepBug.scala 40:21]
    node _data_T_1 = eq(_data_T, UInt<1>("h0")) @[DeepBug.scala 40:28]
    node _data_T_2 = dshl(data, UInt<1>("h1")) @[DeepBug.scala 40:47]
    node _data_T_3 = mux(_data_T_1, UInt<1>("h1"), _data_T_2) @[DeepBug.scala 40:18]
    node _GEN_5 = mux(inc_y, _y_T_1, y) @[DeepBug.scala 31:15 17:18 32:7]
    node _GEN_6 = validif(inc_y, _GEN_1) @[DeepBug.scala 31:15]
    node _GEN_7 = validif(inc_y, _GEN_2) @[DeepBug.scala 31:15]
    node _GEN_8 = mux(inc_y, _GEN_3, UInt<1>("h0")) @[DeepBug.scala 31:15 19:18]
    node _GEN_9 = validif(inc_y, _GEN_4) @[DeepBug.scala 31:15]
    node _GEN_10 = validif(inc_y, y) @[DeepBug.scala 31:15]
    node _GEN_11 = validif(inc_y, clock) @[DeepBug.scala 31:15]
    node _GEN_12 = mux(inc_y, UInt<1>("h1"), UInt<1>("h0")) @[DeepBug.scala 31:15 25:16]
    node _GEN_13 = validif(inc_y, UInt<1>("h1")) @[DeepBug.scala 31:15]
    node _GEN_14 = validif(inc_y, data) @[DeepBug.scala 31:15]
    node _GEN_15 = mux(inc_y, _data_T_3, data) @[DeepBug.scala 31:15 40:12 24:21]
    node _T_3 = dshl(UInt<1>("h1"), x) @[DeepBug.scala 46:32]
    node _T_4 = eq(mem.MPORT_2.data, _T_3) @[DeepBug.scala 46:23]
    node _T_5 = eq(valid.MPORT_3.data, UInt<1>("h0")) @[DeepBug.scala 46:42]
    node _T_6 = or(_T_4, _T_5) @[DeepBug.scala 46:39]
    node _T_7 = bits(reset, 0, 0) @[DeepBug.scala 46:9]
    node _T_8 = eq(_T_7, UInt<1>("h0")) @[DeepBug.scala 46:9]
    node _T_9 = eq(_T_6, UInt<1>("h0")) @[DeepBug.scala 46:9]
    x <= mux(reset, UInt<6>("h0"), _GEN_0) @[DeepBug.scala 16:{18,18}]
    y <= mux(reset, UInt<6>("h0"), _GEN_5) @[DeepBug.scala 17:{18,18}]
    valid.en_x.addr <= x @[DeepBug.scala 26:24]
    valid.en_x.en <= UInt<1>("h1") @[DeepBug.scala 26:24]
    valid.en_x.clk <= clock @[DeepBug.scala 26:24]
    valid.MPORT_3.addr <= x @[DeepBug.scala 46:53]
    valid.MPORT_3.en <= UInt<1>("h1") @[DeepBug.scala 46:53]
    valid.MPORT_3.clk <= clock @[DeepBug.scala 46:53]
    valid.MPORT.addr <= _GEN_6
    valid.MPORT.en <= _GEN_8
    valid.MPORT.clk <= _GEN_7
    valid.MPORT.data <= _GEN_9
    valid.MPORT.mask <= _GEN_9
    data <= bits(mux(reset, UInt<64>("h1"), _GEN_15), 63, 0) @[DeepBug.scala 24:{21,21}]
    mem.MPORT_2.addr <= x @[DeepBug.scala 46:19]
    mem.MPORT_2.en <= UInt<1>("h1") @[DeepBug.scala 46:19]
    mem.MPORT_2.clk <= clock @[DeepBug.scala 46:19]
    mem.MPORT_1.addr <= _GEN_10
    mem.MPORT_1.en <= _GEN_12
    mem.MPORT_1.clk <= _GEN_11
    mem.MPORT_1.data <= _GEN_14
    mem.MPORT_1.mask <= _GEN_13
    printf(clock, and(and(and(UInt<1>("h1"), _T_8), _T_9), UInt<1>("h1")), "Assertion failed: x = %d\n    at DeepBug.scala:46 assert((mem.read(x) === (1.U << x)) || !valid.read(x), \"x = %%d\", x)\n", x) : printf @[DeepBug.scala 46:9]
    assert(clock, _T_6, and(and(UInt<1>("h1"), _T_8), UInt<1>("h1")), "") : assert @[DeepBug.scala 46:9]
