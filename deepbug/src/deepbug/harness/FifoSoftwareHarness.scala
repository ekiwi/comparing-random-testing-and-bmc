package deepbug.harness

import chiseltest.simulator.SimulatorContext
import deepbug.TopmoduleInfo

import scala.collection.mutable

/** checking harness for circular pointer and shift reg fifos. */
class FifoSoftwareHarness(info: TopmoduleInfo) extends TestHarness {
  private var rnd: Option[Rnd] = None

  // pins
  val Push = "io_push"
  val Pop = "io_pop"
  val Full = "io_full"
  val Empty = "io_empty"
  val DataIn = "io_data_in"
  val DataOut = "io_data_out"

  // check for required interface
  {
    val ioNames = (info.inputs ++ info.outputs).map(_.name).toSet
    Seq(Push, Pop, Full, Empty, DataIn, DataOut).foreach { pin =>
      assert(ioNames.contains(pin), s"Failed to find $pin in $info")
    }
  }
  val DataWidth = info.inputs.find(_.name == DataIn).get.width

  // fifo model
  private val queue = new mutable.Queue[BigInt]()

  override def start(rnd: Rnd, sim: SimulatorContext): Unit = {
    this.rnd = Some(rnd)
    this.queue.clear()
  }

  override def step(sim: SimulatorContext): Boolean = {
    val rand = rnd.get
    val canPush = sim.peek(Full) == 0
    val doPush = rand.nextBoolean() && canPush
    if (doPush) {
      sim.poke(Push, 1)
      val data = rand.nextBigInt(DataWidth)
      queue.append(data)
      sim.poke(DataIn, data)
    } else {
      sim.poke(Push, 0)
    }
    val canPop = sim.peek(Empty) == 0
    val doPop = rand.nextBoolean() && canPop
    if (doPop) {
      if (queue.isEmpty) {
        throw new HarnessException("Queue is empty, but hardware does not signal that fact!")
      } else {
        val expected = queue.dequeue()
        sim.poke(Pop, 1)
        val actual = sim.peek(DataOut)
        if (actual != expected) {
          throw new HarnessException(s"Expected to dequeue: $expected, got $actual instead!")
        }
      }
    } else {
      sim.poke(Pop, 0)
    }
    false // never done
  }
}
