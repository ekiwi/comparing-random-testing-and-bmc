package deepbug

import chiseltest.formal.backends._
import chiseltest.formal._
import chiseltest.formal.backends.btor._
import firrtl.backends.experimental.smt._
import firrtl.backends.experimental.smt.random.{InvalidToRandomPass, UndefinedMemoryBehaviorPass}
import firrtl.options.Dependency
import firrtl._
import firrtl.stage._

object BoundedModelCheck {
  def run(fir: CircuitState, timeout: Long): TestResult = {
    val targetDir = Compiler.requireTargetDir(fir.annotations)
    // add reset assumptions
    val withReset = PublicResetAssumptions.withResetAssumptions(fir)
    val sys = toTransitionSystem(withReset)
    val checker = new BtormcModelChecker(targetDir)
    val (length, delta) = checker.check(sys, 100 * 1000, timeout = timeout)

    if (length > 0) {
      TestResult(length, 1, delta.toDouble)
    } else {
      if (length < 0) {
        println(s"BMC TIMEOUT after $timeout s")
      }
      TestResult(length, 0, delta.toDouble)
    }
  }

  private val LoweringAnnos: AnnotationSeq = PublicRunFlattenPass() ++ Seq(
    // we need to flatten the whole circuit
    RunFirrtlTransformAnnotation(Dependency[firrtl.passes.InlineInstances])
  )

  private val Optimizations: AnnotationSeq = Seq(
    RunFirrtlTransformAnnotation(Dependency[firrtl.transforms.ConstantPropagation]),
    RunFirrtlTransformAnnotation(Dependency(passes.CommonSubexpressionElimination)),
    RunFirrtlTransformAnnotation(Dependency[firrtl.transforms.DeadCodeElimination])
  )

  private val DefRandomAnnos: AnnotationSeq = Seq(
    RunFirrtlTransformAnnotation(Dependency(UndefinedMemoryBehaviorPass)),
    RunFirrtlTransformAnnotation(Dependency(InvalidToRandomPass))
  )

  private def firrtlPhase = new FirrtlPhase
  private val doNotOptimize = false

  private def toTransitionSystem(state: CircuitState): TransitionSystem = {
    val opts: AnnotationSeq = if (doNotOptimize) Seq() else Optimizations
    val res = firrtlPhase.transform(
      Seq(
        RunFirrtlTransformAnnotation(Dependency(Btor2Emitter)),
        new CurrentFirrtlStateAnnotation(Forms.LowForm),
        FirrtlCircuitAnnotation(state.circuit)
      ) ++: state.annotations ++: LoweringAnnos ++: opts ++: DefRandomAnnos
    )
    val sys = res.collectFirst { case TransitionSystemAnnotation(s) => s }.get

    // print the system, convenient for debugging, might disable once we have done more testing
    if (true) {
      val targetDir = Compiler.requireTargetDir(state.annotations)
      os.write.over(targetDir / s"${state.circuit.main}.sys", sys.serialize)
    }

    sys
  }
}

/** copy from chiseltest to allow for timing */
class BtormcModelChecker(targetDir: os.Path) {
  val fileExtension = ".btor2"
  val name:   String = "btormc"
  val prefix: String = "btormc"

  def check(sys: TransitionSystem, kMax: Int, timeout: Long = -1): (Int, Long) = {
    // serialize the system to btor2
    val filename = sys.name + ".btor"
    // btromc isn't happy if we include output nodes, so we skip them during serialization
    val lines = Btor2Serializer.serialize(sys, skipOutput = true)
    os.write.over(targetDir / filename, lines.mkString("", "\n", "\n"))

    // execute model checker
    val kmaxOpt = if (kMax > 0) Seq("--kmax", kMax.toString) else Seq()
    val cmd = Seq("btormc") ++ kmaxOpt ++ Seq(filename)
    val timeoutMs = if (timeout < 0) { -1 }
    else { timeout * 1000 }
    val (r, delta) = time(os.proc(cmd).call(cwd = targetDir, check = false, timeout = timeoutMs))

    // write stdout to file for debugging
    val res = r.out.lines()
    os.write.over(targetDir / (filename + ".out"), res.mkString("", "\n", "\n"))

    if (r.exitCode == 143) { // a timeout occurred
      return (-1, delta) // length -1 means timeout!
    }

    // check to see if we were successful
    assert(r.exitCode == 0, s"We expect btormc to always return 0, not ${r.exitCode}. Maybe there was an error.")
    val isSat = res.nonEmpty && res.head.trim.startsWith("sat")

    if (isSat) {
      val witness = Btor2WitnessParser.read(res, 1).head
      (witness.inputs.size, delta)
    } else {
      (0, delta) // length 0 means unsat!
    }
  }
}
