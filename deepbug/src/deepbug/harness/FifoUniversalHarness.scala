package deepbug.harness

import chisel3._
import chisel3.util._
import deepbug.circuits.IsFifo

/** synthesizable harness that is compatible with random testing as well as formal */
class FifoUniversalHarness(makeDut: => IsFifo) extends Module {
  val dut = Module(makeDut)

  // ensure that we only push when the fifo is not full
  val tryPush = IO(Input(ValidIO(chiselTypeOf(dut.io.data_in))))
  dut.io.data_in := tryPush.bits
  dut.io.push := tryPush.valid && !dut.io.full

  // only pop when the fifo is not empty
  val tryPop = IO(Input(Bool()))
  dut.io.pop := tryPop && !dut.io.empty

  // track the correct operation of the fifo using a reference queue
  val reference = Module(new Queue(chiselTypeOf(dut.io.data_in), dut.depth, pipe = true, flow = true))
  reference.io.enq.valid := dut.io.push
  reference.io.enq.bits := dut.io.data_in
  reference.io.deq.ready := dut.io.pop
  when(dut.io.pop) {
    assert(reference.io.count =/= 0.U, "Queue is empty, but hardware does not signal that fact!")
    assert(
      reference.io.deq.bits === dut.io.data_out,
      "Expected to dequeue: %x, got %x instead!",
      reference.io.deq.bits,
      dut.io.data_out
    )
  }

}
