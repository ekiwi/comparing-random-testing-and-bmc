package deepbug

import chiseltest._
import chiseltest.formal._
import deepbug.circuits.{CircularPointerFifo, IsFifo, ShiftRegisterFifo}
import deepbug.harness.{FifoFormalHarness, FifoSoftwareHarness, FifoUniversalHarness, GenericSoftwareHarness}
import deepbug.verification.{FifoFormalTest, FifoRandomSoftwareTests}
import firrtl.options.TargetDirAnnotation
import org.scalatest.exceptions.TestFailedException
import org.scalatest.flatspec.AnyFlatSpec

class ShiftRegFifoTests extends AnyFlatSpec with ChiselScalatestTester with Formal {
  behavior.of("ShiftRegisterFifo")

  import deepbug.verification.FifoConcreteTest._

  it should "fail manual test" in {
    assertThrows[TestFailedException] {
      test(new ShiftRegisterFifo(width = 8, depth = 64, fixed = false)).withAnnotations(Seq()) { dut =>
        findFifoBug(dut)
      }
    }
  }

  it should "pass manual test with fix" in {
    test(new ShiftRegisterFifo(width = 8, depth = 64, fixed = true)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      findFifoBug(dut)
    }
  }

  it should "fail bmc (for a small depth)" in {
    val e = intercept[FailedBoundedCheckException] {
      verify(
        new FifoFormalHarness(new ShiftRegisterFifo(width = 8, depth = 4, fixed = false)),
        Seq(BoundedCheck(2 * 4 + 2), BtormcEngineAnnotation)
      )
    }
    assert(e.failAt == 7)
  }

  it should "fail bmc (for a small depth) with the universal harness" in {
    val e = intercept[FailedBoundedCheckException] {
      verify(
        new FifoUniversalHarness(new ShiftRegisterFifo(width = 8, depth = 4, fixed = false)),
        Seq(BoundedCheck(2 * 4 + 2), BtormcEngineAnnotation)
      )
    }
    assert(e.failAt == 7)
  }

  it should "pass bmc with fix" in {
    verify(
      new FifoFormalHarness(new ShiftRegisterFifo(width = 8, depth = 4, fixed = true)),
      Seq(BoundedCheck(2 * 4 + 2), BtormcEngineAnnotation)
    )
  }

  it should "pass bmc with fix with the universal harness" in {
    verify(
      new FifoUniversalHarness(new ShiftRegisterFifo(width = 8, depth = 4, fixed = true)),
      Seq(BoundedCheck(2 * 4 + 2), BtormcEngineAnnotation)
    )
  }

  it should "fail a random test with depth = 4" in {
    RandomFifoTest.run(new ShiftRegisterFifo(32, 4, fixed = false), getTestName, universalHarness = false)
  }

  it should "fail a random test with depth = 8" in {
    RandomFifoTest.run(new ShiftRegisterFifo(32, 8, fixed = false), getTestName, universalHarness = false)
  }

  it should "fail a random test with depth = 4 and universal harness" in {
    RandomFifoTest.run(new ShiftRegisterFifo(32, 4, fixed = false), getTestName, universalHarness = true)
  }

  it should "fail a random test with depth = 8 and universal harness" in {
    RandomFifoTest.run(new ShiftRegisterFifo(32, 8, fixed = false), getTestName, universalHarness = true)
  }

  private def targetDirAnno = TargetDirAnnotation("test_run_dir/" + getTestName)
  it should "find the bug with random testing" in {
    val width = 8
    val depth = 4
    val maxCycles = 1000
    val seeds: Seq[Int] = Seq.tabulate(10)(a => a)

    val fir = Compiler.fromChisel(new ShiftRegisterFifo(width, depth, fixed = false), targetDirAnno)

    val rs = seeds.map { seed =>
      val dut = TreadleBackendAnnotation.getSimulator.createContext(fir)
      FifoRandomSoftwareTests.run(dut, width, maxCycles, seed)
    }
    val foundBug = rs.count(_.isDefined)
    assert(foundBug == rs.size, "Not all runs found the bug")
    val average = rs.flatten.sum.toDouble / rs.size.toDouble
    println(s"average cycles to find bug for depth=$depth: $average")
    // note: the minimal number of cycles is depth + 2
    //       i.e. for depth=4: 4 + 2 = 6
  }
}
class CircularPointerFifoTests extends AnyFlatSpec with ChiselScalatestTester with Formal {
  behavior.of("CircularPointerFifo")
  import deepbug.verification.FifoConcreteTest._

  it should "fail manual test" in {
    assertThrows[TestFailedException] {
      test(new CircularPointerFifo(width = 8, depth = 64, fixed = false))
        .withAnnotations(Seq(WriteVcdAnnotation))(findFifoBug)
    }
  }

  it should "pass manual test with fix" in {
    test(new CircularPointerFifo(width = 8, depth = 64, fixed = true))
      .withAnnotations(Seq(WriteVcdAnnotation))(findFifoBug)
  }

  it should "fail bmc (for a small depth)" in {
    val e = intercept[FailedBoundedCheckException] {
      verify(
        new FifoFormalHarness(new CircularPointerFifo(width = 8, depth = 4, fixed = false)),
        Seq(BoundedCheck(4 * 5 + 2), BtormcEngineAnnotation)
      )
    }
    assert(e.failAt == 6)
  }

  it should "fail bmc (for a small depth) with universal harness" in {
    val e = intercept[FailedBoundedCheckException] {
      verify(
        new FifoUniversalHarness(new CircularPointerFifo(width = 8, depth = 4, fixed = false)),
        Seq(BoundedCheck(4 * 5 + 2), BtormcEngineAnnotation)
      )
    }
    assert(e.failAt == 6)
  }

  it should "pass bmc with fix" in {
    verify(
      new FifoFormalHarness(new CircularPointerFifo(width = 8, depth = 4, fixed = true)),
      Seq(BoundedCheck(4 * 4 + 2), BtormcEngineAnnotation)
    )
  }

  it should "pass bmc with fix and universal harness" in {
    verify(
      new FifoUniversalHarness(new CircularPointerFifo(width = 8, depth = 4, fixed = true)),
      Seq(BoundedCheck(4 * 4 + 2), BtormcEngineAnnotation)
    )
  }

  it should "fail a random test with depth = 4" in {
    RandomFifoTest.run(new CircularPointerFifo(32, 4, fixed = false), getTestName, universalHarness = false)
  }

  it should "fail a random test with depth = 8" in {
    RandomFifoTest.run(new CircularPointerFifo(32, 8, fixed = false), getTestName, universalHarness = false)
  }

  it should "fail a random test with depth = 4 and universal harness" in {
    RandomFifoTest.run(new CircularPointerFifo(32, 4, fixed = false), getTestName, universalHarness = true)
  }

  it should "fail a random test with depth = 8 and universal harness" in {
    RandomFifoTest.run(new CircularPointerFifo(32, 8, fixed = false), getTestName, universalHarness = true)
  }

  private def targetDirAnno = TargetDirAnnotation("test_run_dir/" + getTestName)
  it should "find the bug with random testing" in {
    val width = 8
    val depth = 4
    val maxCycles = 1000
    val seeds: Seq[Int] = Seq.tabulate(10)(a => a)

    val fir = Compiler.fromChisel(new CircularPointerFifo(width, depth, fixed = false), targetDirAnno)

    val withWave = fir.copy(annotations = fir.annotations :+ WriteVcdAnnotation)

    val rs = seeds.map { seed =>
      val dut = TreadleBackendAnnotation.getSimulator.createContext(withWave)
      val r = FifoRandomSoftwareTests.run(dut, width, maxCycles, seed)
      dut.finish()
      r
    }
    val foundBug = rs.count(_.isDefined)
    assert(foundBug == rs.size, "Not all runs found the bug")
    val average = rs.flatten.sum.toDouble / rs.size.toDouble
    println(s"average cycles to find bug for depth=$depth: $average")
    // note: the minimal number of cycles is depth * 2
    //       i.e. for depth=4: 4 * 2 = 8
  }
}

private object RandomFifoTest {
  def run(makeDut: => IsFifo, testName: String, universalHarness: Boolean = false): Unit = {
    val targetDirAnno = TargetDirAnnotation("test_run_dir/" + testName)
    val fir = if (universalHarness) {
      Compiler.fromChisel(new FifoUniversalHarness(makeDut), targetDirAnno)
    } else { Compiler.fromChisel(makeDut, targetDirAnno) }
    // val firWithWave = fir.copy(annotations = WriteVcdAnnotation +: fir.annotations)
    val info = TopmoduleInfo(fir.circuit)
    val harnessInfo = info.copy(inputs = info.inputs.filterNot(_.name == "reset"))
    val harness = if (universalHarness) { new GenericSoftwareHarness(harnessInfo) }
    else { new FifoSoftwareHarness(harnessInfo) }
    val conf = RandomConfig(seeds = Seq(1, 2, 3), maxCycles = Some(1000), maxRestarts = Some(4))
    val r = RandomTest.run(fir, harness, conf)
    println(
      s"average input length = ${r.averageInputLength}, average time = ${timeWithUnits(r.averageTime)}"
    )
    assert(r.successRate > 0.999)
  }
}
