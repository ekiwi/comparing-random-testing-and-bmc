package deepbug

import chiseltest._
import chiseltest.formal._
import deepbug.circuits.ArbitratedTop
import deepbug.harness.{
  ArbitratedFormalHarness,
  ArbitratedSoftwareHarness,
  ArbitratedUniversalHarness,
  GenericSoftwareHarness
}
import firrtl.options.TargetDirAnnotation
import org.scalatest.flatspec.AnyFlatSpec

class ArbitratedTopTest extends AnyFlatSpec with ChiselScalatestTester with Formal {
  behavior.of("Arbitrated Top")

  it should "fail BMC with depth=2" in {
    val e = intercept[FailedBoundedCheckException] {
      verify(
        new ArbitratedFormalHarness(new ArbitratedTop(numFifos = 2, width = 32, depth = 2, fixed = false)),
        Seq(BoundedCheck(8), BtormcEngineAnnotation)
      )
    }
    assert(e.failAt == 3)
  }

  it should "pass BMC with depth=2" in {
    verify(
      new ArbitratedFormalHarness(new ArbitratedTop(numFifos = 2, width = 32, depth = 2, fixed = true)),
      Seq(BoundedCheck(8), BtormcEngineAnnotation)
    )
  }

  it should "fail BMC with depth=4" in {
    val e = intercept[FailedBoundedCheckException] {
      verify(
        new ArbitratedFormalHarness(new ArbitratedTop(numFifos = 2, width = 32, depth = 4, fixed = false)),
        Seq(BoundedCheck(8), BtormcEngineAnnotation)
      )
    }
    assert(e.failAt == 5)
  }

  it should "pass BMC with depth=4" in {
    verify(
      new ArbitratedFormalHarness(new ArbitratedTop(numFifos = 2, width = 32, depth = 4, fixed = true)),
      Seq(BoundedCheck(8), BtormcEngineAnnotation)
    )
  }

  it should "fail BMC with depth=8" in {
    val e = intercept[FailedBoundedCheckException] {
      verify(
        new ArbitratedFormalHarness(new ArbitratedTop(numFifos = 2, width = 32, depth = 8, fixed = false)),
        Seq(BoundedCheck(16), BtormcEngineAnnotation)
      )
    }
    assert(e.failAt == 9)
  }

  it should "pass BMC with depth=8" in {

    verify(
      new ArbitratedFormalHarness(new ArbitratedTop(numFifos = 2, width = 32, depth = 8, fixed = true)),
      Seq(BoundedCheck(16), BtormcEngineAnnotation)
    )

  }

  it should "fail BMC with depth=4 and 3 fifos" in {
    val e = intercept[FailedBoundedCheckException] {
      verify(
        new ArbitratedFormalHarness(new ArbitratedTop(numFifos = 3, width = 32, depth = 4, fixed = false)),
        Seq(BoundedCheck(8), BtormcEngineAnnotation)
      )
    }
    assert(e.failAt == 5)
  }

  it should "pass BMC with depth=4 and 3 fifos" in {
    verify(
      new ArbitratedFormalHarness(new ArbitratedTop(numFifos = 3, width = 32, depth = 4, fixed = true)),
      Seq(BoundedCheck(8), BtormcEngineAnnotation)
    )
  }

  private def randomTest(depth: Int, numFifos: Int = 2, universalHarness: Boolean = false): Unit = {
    val targetDirAnno = TargetDirAnnotation("test_run_dir/" + this.getTestName)
    val fir = if (universalHarness) {
      Compiler.fromChisel(
        new ArbitratedUniversalHarness(new ArbitratedTop(numFifos = numFifos, width = 32, depth = depth)),
        targetDirAnno
      )
    } else { Compiler.fromChisel(new ArbitratedTop(numFifos = numFifos, width = 32, depth = depth), targetDirAnno) }
    // val firWithWave = fir.copy(annotations = WriteVcdAnnotation +: fir.annotations)
    val info = TopmoduleInfo(fir.circuit)
    val harnessInfo = info.copy(inputs = info.inputs.filterNot(_.name == "reset"))
    val harness = if (universalHarness) { new GenericSoftwareHarness(harnessInfo) }
    else { new ArbitratedSoftwareHarness(harnessInfo) }
    val conf = RandomConfig(seeds = Seq(1, 2, 3), maxCycles = Some(1000), maxRestarts = Some(4))
    val r = RandomTest.run(fir, harness, conf)
    println(
      s"depth=$depth, numFifos=$numFifos, average input length = ${r.averageInputLength}, average time = ${timeWithUnits(r.averageTime)}"
    )
    assert(r.successRate > 0.999)
  }

  it should "fail random testing with depth=2" in {
    randomTest(2, 2)
  }

  it should "fail random testing with depth=4" in {
    randomTest(4, 2)
  }

  it should "fail random testing with depth=8" in {
    randomTest(8, 2)
  }

  it should "fail random testing with depth=64" in {
    randomTest(64, 2)
  }

  it should "fail random testing with depth=64 and numFifos=4" in {
    randomTest(64, 4)
  }

  it should "fail BMC with depth=2 and universal test harness" in {
    val e = intercept[FailedBoundedCheckException] {
      verify(
        new ArbitratedUniversalHarness(new ArbitratedTop(numFifos = 2, width = 32, depth = 2, fixed = false)),
        Seq(BoundedCheck(8), BtormcEngineAnnotation)
      )
    }
    assert(e.failAt == 3)
  }

  it should "pass BMC with fix and depth=2 and universal test harness" in {
    verify(
      new ArbitratedUniversalHarness(new ArbitratedTop(numFifos = 2, width = 32, depth = 2, fixed = true)),
      Seq(BoundedCheck(8), BtormcEngineAnnotation)
    )
  }

  it should "fail BMC with depth=8 and universal test harness" in {
    val e = intercept[FailedBoundedCheckException] {
      verify(
        new ArbitratedUniversalHarness(new ArbitratedTop(numFifos = 2, width = 32, depth = 8, fixed = false)),
        Seq(BoundedCheck(16), BtormcEngineAnnotation)
      )
    }
    assert(e.failAt == 9)
  }

  it should "fail random testing with depth=2 and universal harness" in {
    randomTest(2, 2, universalHarness = true)
  }

  it should "fail random testing with depth=4 and universal harness" in {
    randomTest(4, 2, universalHarness = true)
  }

  it should "fail random testing with depth=8 and universal harness" in {
    randomTest(8, 2, universalHarness = true)
  }

  it should "fail random testing with depth=64 and universal harness" in {
    randomTest(64, 2, universalHarness = true)
  }

  it should "fail random testing with depth=64 and numFifos=4 and universal harness" in {
    randomTest(64, 4, universalHarness = true)
  }
}
