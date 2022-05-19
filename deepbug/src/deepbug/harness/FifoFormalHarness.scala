package deepbug.harness

import chisel3._
import chisel3.util._
import chiseltest.formal.MagicPacketTracker
import deepbug.circuits.IsFifo

class FifoFormalHarness(makeFifo: => IsFifo) extends Module {
  val dut = Module(makeFifo)
  val enq = IO(Flipped(DecoupledIO(chiselTypeOf(dut.io.data_in))))
  dut.io.data_in := enq.bits
  enq.ready := !dut.io.full
  dut.io.push := enq.fire // only push if fifo is not full
  val deq = IO(DecoupledIO(chiselTypeOf(dut.io.data_in)))
  deq.bits := dut.io.data_out
  deq.valid := !dut.io.empty
  dut.io.pop := deq.fire // only pop if fifo is not empty

  // checker from chisel standard library
  // note: we increase the depth in order to avoid the overflow check that is not part of the original benchmark
  MagicPacketTracker(enq, deq, dut.depth * 2)
}
