package deepbug.harness

import chiseltest.simulator.SimulatorContext
import deepbug.TopmoduleInfo

import scala.collection.mutable

/** checking harness for arbitrated top. */
class ArbitratedSoftwareHarness(info: TopmoduleInfo) extends TestHarness {
  private var rnd: Option[Rnd] = None

  // find the number of fifos
  val NumFifos = info.inputs.count(_.name.startsWith("io_push_"))
  assert(NumFifos > 0)
  def FifoIndices = 0 until NumFifos
  val DataWidth = info.outputs.find(_.name == "io_data_out").get.width

  // fifo models
  private val queues = FifoIndices.map(_ => new mutable.Queue[BigInt]())

  override def start(rnd: Rnd, sim: SimulatorContext): Unit = {
    this.rnd = Some(rnd)
    this.queues.foreach(_.clear())
  }

  override def step(sim: SimulatorContext): Boolean = {
    val rand = rnd.get

    // find out which fifos have credit or are empty
    val hasCredit = FifoIndices.map(ii => sim.peek(s"has_credit_$ii") != 0)
    val creditIsMax = FifoIndices.map(ii => sim.peek(s"creditIsMax_$ii") != 0)
    val isEmpty = FifoIndices.map(ii => sim.peek(s"empty_$ii") != 0)

    // we randomly decide for each fifo whether we want to push to it or not
    queues.zip(hasCredit).zipWithIndex.foreach { case ((queue, canPush), ii) =>
      val doPush = rand.nextBoolean() && canPush
      if (doPush) {
        sim.poke(s"io_push_$ii", 1)
        val data = rand.nextBigInt(DataWidth)
        queue.append(data)
        sim.poke(s"io_data_in_$ii", data)
      } else {
        sim.poke(s"io_push_$ii", 0)
      }
    }

    // we randomly decide whether to request a value or not
    val availableFifos = isEmpty
      .zip(creditIsMax)
      .zipWithIndex
      .filter { case ((empty, creditMax), _) =>
        !empty && !creditMax // We are only allowed to pop from a fifo when it is not empty and its credit
      // is not the maximum credit. This encodes two assumptions from the original design.
      }
      .map(_._2)
    val canPop = availableFifos.nonEmpty
    val doPop = rand.nextBoolean() && canPop
    if (doPop) {
      // randomly pick a non empty fifo
      val fifoIndex = rand.choice(availableFifos)
      val queue = queues(fifoIndex)

      if (queue.isEmpty) {
        throw new HarnessException(s"Queue $fifoIndex is empty, but hardware does not signal that fact!")
      } else {
        val expected = queue.dequeue()
        sim.poke("io_req", 1)
        sim.poke("io_gnt_sel", fifoIndex)
        val actual = sim.peek("io_data_out")
        if (actual != expected) {
          throw new HarnessException(s"Expected to dequeue: $expected, got $actual instead! ($fifoIndex)")
        }
      }
    } else {
      sim.poke("io_req", 0)
    }

    false // never done
  }
}
