package deepbug.harness

import chisel3._
import chisel3.util._
import deepbug.circuits.ArbitratedTop

/** synthesizable harness that is compatible with random testing as well as formal */
class ArbitratedUniversalHarness(makeDut: => ArbitratedTop) extends Module {
  val dut = Module(makeDut)

  val NumFifos = dut.empty.size
  val Depth = dut.depth
  assert(NumFifos > 0)
  def FifoIndices = 0 until NumFifos

  // fifo models with some extra depth
  val queues =
    FifoIndices.map(_ => Module(new Queue(chiselTypeOf(dut.io.data_out), Depth * 2, pipe = true, flow = true)))

  // input which decides which fifo we _might_ push to
  val tryPush = IO(Input(Vec(NumFifos, Bool())))
  val fifoDataIn = IO(Input(Vec(NumFifos, chiselTypeOf(dut.io.data_out))))
  dut.io.data_in := fifoDataIn
  // we want to push if the fifo has credit
  dut.io.push := tryPush.zip(dut.has_credit).map { case (t, c) => t && c }

  // should we try to request?
  val tryReq = IO(Input(Bool()))
  val available: UInt = (~dut.empty.asUInt) & (~dut.creditIsMax.asUInt)
  dut.io.req := tryReq && available =/= 0.U
  // randomly rotate availability, mark the lsb that is set and rotate back
  val selectShift = IO(Input(chiselTypeOf(dut.io.gnt_sel)))
  val availableRotated = available.rotateLeft(selectShift)
  val availableRotatedOH = PriorityEncoderOH(availableRotated)
  val select = availableRotatedOH.rotateRight(selectShift)
  dut.io.gnt_sel := OHToUInt(select)

  // track values that enter or exit
  dut.io.push.zip(dut.io.data_in).zip(queues).foreach { case ((push, data), queue) =>
    queue.io.enq.valid := push
    queue.io.enq.bits := data
    queue.io.deq.ready := false.B // default
  }
  when(dut.io.req) {
    queues.zipWithIndex.foreach { case (queue, ii) =>
      when(dut.io.gnt_sel === ii.U) {
        queue.io.deq.ready := true.B
        assert(queue.io.deq.valid, s"Queue $ii is empty, but hardware does not signal that fact!")
        assert(
          queue.io.deq.bits === dut.io.data_out,
          s"Expected to dequeue: %x, got %x instead! ($ii)",
          queue.io.deq.bits,
          dut.io.data_out
        )
      }
    }
  }
}
