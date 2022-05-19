package deepbug.verification

import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util._
import chiseltest._
import chiseltest.formal.MagicPacketTracker
import chiseltest.simulator.SimulatorContext
import deepbug.circuits.{CircularPointerFifo, IsFifo, ShiftRegisterFifo}

import scala.collection.mutable

object FifoConcreteTest {
  def push(dut: IsFifo, data: BigInt): Unit = {
    dut.io.full.expect(false.B, "if the fifo is full we cannot push")
    dut.io.push.poke(true.B)
    dut.io.data_in.poke(data.U)
    dut.clock.step()
    dut.io.push.poke(false.B)
    dut.io.data_in.poke(0.U)
  }

  def pop(dut: IsFifo, data: BigInt): Unit = {
    dut.io.empty.expect(false.B, "if the fifo is empty we cannot pop")
    dut.io.pop.poke(true.B)
    dut.io.data_out.expect(data.U)
    dut.clock.step()
    dut.io.pop.poke(false.B)
  }

  def pushPop(dut: IsFifo, dataIn: BigInt, dataOut: BigInt): Unit = {
    dut.io.empty.expect(false.B, "if the fifo is empty we cannot pop")
    dut.io.full.expect(false.B, "if the fifo is full we cannot push")
    dut.io.push.poke(true.B)
    dut.io.data_in.poke(dataIn.U)
    dut.io.pop.poke(true.B)
    dut.io.data_out.expect(dataOut.U)
    dut.clock.step()
    dut.io.pop.poke(false.B)
    dut.io.push.poke(false.B)
    dut.io.data_in.poke(0.U)
  }

  // the bugs can be found by making the fifo full and then emptying it
  def findFifoBug(dut: ShiftRegisterFifo): Unit = {
    val rand = new scala.util.Random(0)
    val values = Seq.tabulate(dut.depth)(_ => BigInt(dut.width, rand))
    dut.io.empty.expect(true.B, "fifo should be empty at the start of the test")
    // push all values
    values.foreach { v => push(dut, v) }
    dut.io.full.expect(true.B, "fifo should be full")
    // pop all values
    values.foreach { v => pop(dut, v) }
    dut.io.empty.expect(true.B, "fifo should be empty now")
  }

  def findFifoBug(dut: CircularPointerFifo): Unit = {
    val rand = new scala.util.Random(0)
    val values = Seq.tabulate(dut.depth + 2)(o => BigInt(o + 1))
    dut.io.empty.expect(true.B, "fifo should be empty at the start of the test")
    // push one value
    push(dut, values.head)
    // push and pop
    values.drop(1).zip(values).foreach { case (dataIn, dataOut) =>
      pushPop(dut, dataIn = dataIn, dataOut = dataOut)
    }
    // check final value
    pop(dut, values.last)
    dut.io.empty.expect(true.B, "fifo should be empty now")
  }
}

class FifoHarness(makeFifo: => IsFifo) extends Module {
  val dut = Module(makeFifo)
  val enq = IO(Flipped(DecoupledIO(chiselTypeOf(dut.io.data_in))))
  dut.io.data_in := enq.bits
  enq.ready := !dut.io.full
  dut.io.push := enq.fire // only push if fifo is not full
  val deq = IO(DecoupledIO(chiselTypeOf(dut.io.data_in)))
  deq.bits := dut.io.data_out
  deq.valid := !dut.io.empty
  dut.io.pop := deq.fire // only pop if fifo is not empty
}

class FifoFormalTest(makeFifo: => IsFifo) extends FifoHarness(makeFifo) {
  MagicPacketTracker(enq, deq, dut.depth)
}

object FifoRandomSoftwareTests {
  def run(dut: SimulatorContext, width: Int, maxCycles: Int, seed: Long): Option[Long] = {
    // reset the design
    dut.poke("reset", 1)
    dut.step()
    dut.poke("reset", 0)
    val rand = new scala.util.Random(seed = seed)
    val queue = new mutable.Queue[BigInt]()
    var cycleCount = 0
    var foundBug = false
    while (!foundBug && cycleCount <= maxCycles) {
      val canPush = dut.peek("io_full") == 0
      val doPush = rand.nextBoolean() && canPush
      if (doPush) {
        dut.poke("io_push", 1)
        val data = BigInt(width, rand)
        queue.append(data)
        dut.poke("io_data_in", data)
      } else {
        dut.poke("io_push", 0)
      }
      val canPop = dut.peek("io_empty") == 0
      val doPop = rand.nextBoolean() && canPop
      if (doPop) {
        if (queue.isEmpty) {
          foundBug = true // queue is empty, but hardware does not signal that fact
        } else {
          val expected = queue.dequeue()
          dut.poke("io_pop", 1)
          val actual = dut.peek("io_data_out")
          if (actual != expected) {
            foundBug = true // wrong value dequeued
          }
        }
      } else {
        dut.poke("io_pop", 0)
      }
      cycleCount += 1
      dut.step()
    }
    if (foundBug) Some(cycleCount) else None
  }
}

class CircularPointerFifoWidth32Depth4 extends FifoHarness(new CircularPointerFifo(width = 32, depth = 4))
class CircularPointerFifoWidth32Depth8 extends FifoHarness(new CircularPointerFifo(width = 32, depth = 8))
class CircularPointerFifoWidth32Depth16 extends FifoHarness(new CircularPointerFifo(width = 32, depth = 16))
class CircularPointerFifoWidth32Depth32 extends FifoHarness(new CircularPointerFifo(width = 32, depth = 32))
class CircularPointerFifoWidth32Depth64 extends FifoHarness(new CircularPointerFifo(width = 32, depth = 64))

class ShiftRegisterFifoWidth32Depth4 extends FifoHarness(new ShiftRegisterFifo(width = 32, depth = 4))
class ShiftRegisterFifoWidth32Depth8 extends FifoHarness(new ShiftRegisterFifo(width = 32, depth = 8))
class ShiftRegisterFifoWidth32Depth16 extends FifoHarness(new ShiftRegisterFifo(width = 32, depth = 16))
class ShiftRegisterFifoWidth32Depth32 extends FifoHarness(new ShiftRegisterFifo(width = 32, depth = 32))
class ShiftRegisterFifoWidth32Depth64 extends FifoHarness(new ShiftRegisterFifo(width = 32, depth = 64))

object CompileFifos {

  def main(args: Array[String]): Unit = {
    val stage = new ChiselStage
    stage.emitChirrtl(new CircularPointerFifoWidth32Depth4)
    stage.emitChirrtl(new CircularPointerFifoWidth32Depth8)
    stage.emitChirrtl(new CircularPointerFifoWidth32Depth16)
    stage.emitChirrtl(new CircularPointerFifoWidth32Depth32)
    stage.emitChirrtl(new CircularPointerFifoWidth32Depth64)

    stage.emitChirrtl(new ShiftRegisterFifoWidth32Depth4)
    stage.emitChirrtl(new ShiftRegisterFifoWidth32Depth8)
    stage.emitChirrtl(new ShiftRegisterFifoWidth32Depth16)
    stage.emitChirrtl(new ShiftRegisterFifoWidth32Depth32)
    stage.emitChirrtl(new ShiftRegisterFifoWidth32Depth64)
  }
}
