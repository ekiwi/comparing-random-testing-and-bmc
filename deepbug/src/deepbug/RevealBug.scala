package deepbug

import chiseltest.TreadleBackendAnnotation
import chiseltest.simulator.{SimulatorContext, StepInterrupted, StepOk}
import firrtl.CircuitState

object RevealBug {
  def run(design: String, p: Map[String, String], fir: CircuitState): TestResult = {
    val dut = loadSim(fir)
    reset(dut)
    val (length, delta) = time(design match {
      case "deepbug"       => RevealDeepBug(dut, p("regSize").toInt)
      case "circular-fifo" => RevealFifoBug.circularFifo(dut, p("width").toInt, p("depth").toInt)
      case "shift-fifo"    => RevealFifoBug.shiftFifo(dut, p("width").toInt, p("depth").toInt)
      case other           => throw new RuntimeException(s"do no know how to reveal bug for $other")
    })
    if (length >= 0) { TestResult(length + 1, 1, delta.toDouble) }
    else { Fail }
  }

  private val Fail = TestResult(0, 0, 0)
  private def reset(dut: SimulatorContext): Unit = {
    dut.poke("reset", 1)
    dut.step(1)
    dut.poke("reset", 0)
  }

  private def loadSim(fir: CircuitState): SimulatorContext = {
    TreadleBackendAnnotation.getSimulator.createContext(fir)
  }
}

object RevealDeepBug {
  def apply(dut: SimulatorContext, regSize: Int): Int = {
    // in order to reveal the bug it should be enough to never increment x and always increment y
    val cycles = 1 << regSize
    dut.poke("inc_x", 0)
    dut.poke("inc_y", 1)
    dut.step(cycles + 2) match {
      case StepOk => -1
      case StepInterrupted(after, isFailure, sources) =>
        assert(isFailure)
        after
    }
  }
}

object RevealFifoBug {
  def push(dut: SimulatorContext, data: BigInt): Unit = {
    assert(dut.peek("io_full") == 0, "if the fifo is full we cannot push")
    dut.poke("io_push", 1)
    dut.poke("io_data_in", data)
    dut.step()
    dut.poke("io_push", 0)
    dut.poke("io_data_in", 0)
  }

  def pop(dut: SimulatorContext, data: BigInt): Unit = {
    assert(dut.peek("io_empty") == 0, "if the fifo is empty we cannot pop")
    dut.poke("io_pop", 1)
    val actual = dut.peek("io_data_out")
    assert(actual == data, s"$actual != $data")
    dut.step()
    dut.poke("io_pop", 0)
  }

  def pushPop(dut: SimulatorContext, dataIn: BigInt, dataOut: BigInt): Unit = {
    assert(dut.peek("io_empty") == 0, "if the fifo is empty we cannot pop")
    assert(dut.peek("io_full") == 0, "if the fifo is full we cannot push")
    dut.poke("io_push", 1)
    dut.poke("io_data_in", dataIn)
    dut.poke("io_pop", 1)
    val actual = dut.peek("io_data_out")
    assert(actual == dataOut, s"$actual != $dataOut")
    dut.step()
    dut.poke("io_pop", 0)
    dut.poke("io_push", 0)
    dut.poke("io_data_in", 0)
  }

  def shiftFifo(dut: SimulatorContext, width: Int, depth: Int): Int = {
    val rand = new scala.util.Random(0)
    val values = Seq.tabulate(depth)(_ => BigInt(width, rand))
    assert(dut.peek("io_empty") == 1, "fifo should be empty at the start of the test")
    // push all values
    values.foreach { v => push(dut, v) }
    assert(dut.peek("io_full") == 1, "fifo should be full")
    // pop all values
    values.foreach { v => pop(dut, v) }
    assert(dut.peek("io_empty") == 1, "fifo should be empty now")
    1 + 2 * values.length
  }

  def circularFifo(dut: SimulatorContext, width: Int, depth: Int): Int = {
    val values = Seq.tabulate(depth + 2)(o => BigInt(o + 1))
    assert(dut.peek("io_empty") == 1, "fifo should be empty at the start of the test")
    // push one value
    push(dut, values.head)
    // push and pop
    values.drop(1).zip(values).foreach { case (dataIn, dataOut) =>
      pushPop(dut, dataIn = dataIn, dataOut = dataOut)
    }
    // check final value
    pop(dut, values.last)
    assert(dut.peek("io_empty") == 1, "fifo should be empty now")
    1 + values.length + 1
  }
}
