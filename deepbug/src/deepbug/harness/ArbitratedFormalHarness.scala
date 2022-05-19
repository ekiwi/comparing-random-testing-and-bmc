package deepbug.harness

import chisel3._
import chisel3.util._
import chiseltest.formal.MagicPacketTracker
import deepbug.circuits.ArbitratedTop

class ArbitratedFormalHarness(makeDut: => ArbitratedTop) extends Module {
  val dut = Module(makeDut)
  val io = IO(chiselTypeOf(dut.io))
  io <> dut.io

  // we track fifo 0
  val Tracked = 0
  val enq = Wire(ValidIO(chiselTypeOf(io.data_out)))
  val deq = Wire(ValidIO(chiselTypeOf(io.data_out)))
  enq.valid := io.push(Tracked)
  enq.bits := io.data_in(Tracked)
  deq.valid := io.gnt(Tracked)
  deq.bits := io.data_out
  MagicPacketTracker(enq = enq, deq = deq, depth = dut.depth + 2)
}
