package deepbug

import deepbug.harness.{GenericSoftwareHarness, TestHarness}
import firrtl.options.TargetDirAnnotation
import firrtl.transforms.formal.DontAssertSubmoduleAssumptionsAnnotation

object Main {
  def main(args: Array[String]): Unit = {
    val parser = new DeepBugParser()
    val conf = parser.parse(args, Config()).get

    // load dut
    val makeDut = Designs.load(conf)

    // generate the design
    val targetDirAnno = TargetDirAnnotation("runs/" + conf.getName)
    val fir = Compiler.fromChisel(makeDut(), Seq(targetDirAnno, DontAssertSubmoduleAssumptionsAnnotation))
    val info = TopmoduleInfo(fir.circuit)

    val res = conf.method match {
      case "random" =>
        // the harness does not control the reset pins
        val harnessInfo = info.copy(inputs = info.inputs.filterNot(_.name == "reset"))
        val harness: TestHarness = Designs.getSoftwareHarness(conf)(harnessInfo)
        RandomTest.run(fir, harness, conf.rand)
      case "bmc" =>
        BoundedModelCheck.run(fir, conf.timeout)
      case "reveal" =>
        RevealBug.run(conf.design, conf.designParams, fir)
    }

    // print the results
    println(s"Success rate: ${res.successRate * 100}%")
    println(s"Average time: ${timeWithUnits(res.averageTime)}")
    println(s"Average number of cycles: ${res.averageInputLength}")

    // save the result
    saveResult(conf, res)

  }

  private case class ExperimentResult(conf: Config, res: TestResult)
  private def saveResult(conf: Config, res: TestResult): Unit = {
    val data = ExperimentResult(conf, res)
    val filename = os.pwd / "runs" / conf.getName / "result.json"
    import upickle.default._
    implicit val overallTestResultRW = upickle.default.macroRW[TestResult]
    implicit val randomConfigRW = upickle.default.macroRW[RandomConfig]
    implicit val configRW = upickle.default.macroRW[Config]
    implicit val experimentResultRW = upickle.default.macroRW[ExperimentResult]
    os.write.over(filename, upickle.default.write(data))
    println(s"Wrote results to: $filename")
  }
}
