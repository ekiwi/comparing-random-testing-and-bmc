circuit ShiftRegisterFifo :
  module ShiftRegisterFifo :
    input clock : Clock
    input reset : UInt<1>
    input io_push : UInt<1>
    input io_pop : UInt<1>
    input io_data_in : UInt<8>
    output io_full : UInt<1>
    output io_empty : UInt<1>
    output io_data_out : UInt<8>

    reg count : UInt<3>, clock with :
      reset => (UInt<1>("h0"), count) @[ShiftRegisterFifo.scala 14:22]
    node _count_T = add(count, io_push) @[ShiftRegisterFifo.scala 15:18]
    node _count_T_1 = tail(_count_T, 1) @[ShiftRegisterFifo.scala 15:18]
    node _count_T_2 = sub(_count_T_1, io_pop) @[ShiftRegisterFifo.scala 15:28]
    node _count_T_3 = tail(_count_T_2, 1) @[ShiftRegisterFifo.scala 15:28]
    node _io_empty_T = eq(count, UInt<1>("h0")) @[ShiftRegisterFifo.scala 17:21]
    node _io_full_T = geq(count, UInt<3>("h4")) @[ShiftRegisterFifo.scala 18:20]
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
    node next_value_3 = validif(UInt<1>("h0"), UInt<8>("h0"))
    node _GEN_3 = mux(_entries_T_11, next_value_3, entries_3) @[ShiftRegisterFifo.scala 23:51 24:11 22:22]
    io_full <= _io_full_T @[ShiftRegisterFifo.scala 18:11]
    io_empty <= _io_empty_T @[ShiftRegisterFifo.scala 17:12]
    io_data_out <= entries_0 @[ShiftRegisterFifo.scala 36:15]
    count <= mux(reset, UInt<3>("h0"), _count_T_3) @[ShiftRegisterFifo.scala 14:{22,22} 15:9]
    entries_0 <= mux(reset, UInt<8>("h0"), _GEN_0) @[ShiftRegisterFifo.scala 22:{22,22}]
    entries_1 <= mux(reset, UInt<8>("h0"), _GEN_1) @[ShiftRegisterFifo.scala 22:{22,22}]
    entries_2 <= mux(reset, UInt<8>("h0"), _GEN_2) @[ShiftRegisterFifo.scala 22:{22,22}]
    entries_3 <= mux(reset, UInt<8>("h0"), _GEN_3) @[ShiftRegisterFifo.scala 22:{22,22}]
