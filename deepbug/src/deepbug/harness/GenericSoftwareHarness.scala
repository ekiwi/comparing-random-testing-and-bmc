package deepbug.harness

import chiseltest.simulator.SimulatorContext
import deepbug.TopmoduleInfo

class GenericSoftwareHarness(info: TopmoduleInfo) extends TestHarness {
  private var rnd: Option[Rnd] = None

  override def start(rnd: Rnd, sim: SimulatorContext): Unit = {
    this.rnd = Some(rnd)
  }

  private val inputBits = info.inputs.map(_.width).sum
  private val inputSize = scala.math.ceil(inputBits.toDouble / 8.0).toInt

  private def applyInputs(sim: SimulatorContext, bytes: Array[Byte]): Unit = {
    var input: BigInt = bytes.zipWithIndex.map { case (b, i) => (0xff & BigInt(b)) << (i * 8) }.reduce(_ | _)
    info.inputs.foreach { inp =>
      val mask = (BigInt(1) << inp.width) - 1
      val value = input & mask
      input = input >> inp.width
      //println("'" + name + "'", bits.toString, value.toString)
      sim.poke(inp.name, value)
    }
    //println("---")
  }

  override def step(sim: SimulatorContext): Boolean = {
    val inputBytes = rnd.get.nextBytes(inputSize)
    if (inputBytes.nonEmpty) {
      applyInputs(sim, inputBytes)
    }
    val done = inputBytes.isEmpty
    done
  }
}
