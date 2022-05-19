package deepbug

import chisel3._
import chiseltest._
import chiseltest.formal._
import chiseltest.simulator.{SimulatorContext, StepInterrupted, StepOk}
import firrtl.options.TargetDirAnnotation
import org.scalatest.flatspec.AnyFlatSpec
import deepbug.circuits.DeepBug

class DeepBugTest extends AnyFlatSpec with ChiselScalatestTester with Formal {
  behavior.of("DeepBug")

  it should "expose the bug with a smaller size for x and y" in {
    val e = intercept[FailedBoundedCheckException] {
      verify(new DeepBug(2), Seq(BoundedCheck(10), BtormcEngineAnnotation))
    }
    assert(e.failAt == 5, "should fail exactly 5 cycles after reset")
  }

  it should "not find a bug in the non-buggy design" in {
    verify(new DeepBug(2, false), Seq(BoundedCheck(7), BtormcEngineAnnotation))
  }

  it should "find the bug with concrete testing" in {
    Seq(1, 3, 6).foreach { regSize =>
      assertThrows[ChiselAssertionError] {
        test(new DeepBug(regSize))(RevealDeepBug.run)
      }
    }
  }

  private def targetDirAnno = TargetDirAnnotation("test_run_dir/" + getTestName)
  it should "find the bug with random testing" in {
    val regSize = 6
    val maxCycles = 1000
    val seeds: Seq[Int] = Seq.tabulate(10)(a => a)

    val fir = Compiler.fromChisel(new DeepBug(regSize), targetDirAnno)

    val rs = seeds.map { seed =>
      val dut = TreadleBackendAnnotation.getSimulator.createContext(fir)
      DeepBugRandomTesting.run(dut, maxCycles, seed)
    }
    val foundBug = rs.count(_.isDefined)
    assert(foundBug == rs.size, "Not all runs found the bug")
    val average = rs.flatten.sum.toDouble / rs.size.toDouble
    println(s"average cycles to find bug for regSize=$regSize: $average")
    // note: the minimal number of cycles is 1 << regSize + 2
    //       i.e. for regSize=6: 64 + 2 = 66
  }
}

object RevealDeepBug {
  // in order to reveal the bug it should be enough to never increment x and always increment y
  def run(dut: DeepBug): Unit = {
    val cycles = 1 << dut.regSize
    dut.inc_x.poke(false.B)
    dut.inc_y.poke(true.B)
    dut.clock.step(cycles + 2)
  }
}

object DeepBugRandomTesting {
  def run(dut: SimulatorContext, maxCycles: Int, seed: Long): Option[Long] = {
    // reset the design
    dut.poke("reset", 1)
    dut.step()
    dut.poke("reset", 0)
    val rand = new scala.util.Random(seed = seed)
    var cycleCount = 0
    var foundBug = false
    while (!foundBug && cycleCount <= maxCycles) {
      val i = rand.nextInt(3)
      dut.poke("inc_x", (i >> 0) & 1)
      dut.poke("inc_y", (i >> 1) & 1)
      dut.step() match {
        case StepOk => // all right
        case StepInterrupted(_, isFailure, _) =>
          assert(isFailure)
          foundBug = true
      }
      cycleCount += 1
    }
    if (foundBug) Some(cycleCount) else None
  }
}
