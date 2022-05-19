package deepbug

import chiseltest.TreadleBackendAnnotation
import chiseltest.simulator.{SimulatorContext, StepInterrupted, StepOk}
import deepbug.harness.{HarnessException, ScalaRandom, TestHarness}
import firrtl.CircuitState

case class TestResult(
  averageInputLength: Double,
  successRate:        Double,
  averageTime:        Double)

case class RandomTestResult(cycles: Int, restarts: Int, length: Int, time: Long)

object RandomTest {
  def run(fir: CircuitState, harness: TestHarness, conf: RandomConfig): TestResult = {
    val (seeds, maxCycles, maxRestarts) = conf.get
    // run one experiment for every seed
    val results = seeds.flatMap(run(fir, harness, _, maxCycles, maxRestarts))
    val res = processResults(seeds.length, results)
    res
  }

  private def processResults(numSeeds: Int, results: Seq[RandomTestResult]): TestResult = {
    if (results.isEmpty) {
      TestResult(0, 0, 0)
    } else {
      TestResult(
        averageInputLength = results.map(_.length).sum.toDouble / results.size.toDouble,
        successRate = results.length.toDouble / numSeeds.toDouble,
        averageTime = results.map(_.time).sum.toDouble / results.size.toDouble
      )
    }
  }

  private def run(
    fir:         CircuitState,
    harness:     TestHarness,
    seed:        Long,
    maxCycles:   Int,
    maxRestarts: Int
  ): Option[RandomTestResult] = {
    val rand = new ScalaRandom(new scala.util.Random(seed = seed))

    var restarts = 0
    var totalTime: Long = 0
    while (restarts < maxRestarts) {

      val dut = loadSim(fir)
      // reset the design
      dut.poke("reset", 1)
      dut.step()
      dut.poke("reset", 0)

      harness.start(rand, dut)

      val (cycles, delta) = time(run(dut, harness, maxCycles))
      totalTime += delta
      cycles match {
        case Some(c) =>
          // + 1 to account for resets
          val totalLength = restarts * (maxCycles + 1) + (c + 1)
          return Some(
            RandomTestResult(
              cycles = totalLength,
              restarts = restarts,
              length = (c + 1),
              time = totalTime
            )
          )
        case None =>
          restarts += 1
      }
    }
    None
  }

  private def loadSim(fir: CircuitState): SimulatorContext = {
    TreadleBackendAnnotation.getSimulator.createContext(fir)
  }

  private def run(dut: SimulatorContext, harness: TestHarness, maxCycles: Int): Option[Int] = {
    var cycleCount = 0
    var foundBug = false

    // run harness until we find a bug or the maximum number of cycles is achieved
    try {
      while (!foundBug && cycleCount <= maxCycles) {
        harness.step(dut)
        dut.step() match {
          case StepOk => // all right
          case StepInterrupted(_, isFailure, _) =>
            assert(isFailure)
            foundBug = true
        }
        cycleCount += 1
      }
      if (foundBug) Some(cycleCount) else None
    } catch {
      case h: HarnessException =>
        println(s"Found bug @ $cycleCount: ${h.getMessage}")
        // found bug!
        Some(cycleCount)
    }
  }
}

private object time {
  def apply[T](f: => T): (T, Long) = {
    val start = System.nanoTime()
    val r = f
    val delta = System.nanoTime() - start
    (r, delta)
  }
}
