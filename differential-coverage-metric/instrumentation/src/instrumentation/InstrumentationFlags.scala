// Copyright 2021-2022 The Regents of the University of California
// released under BSD 3-Clause License
// author: Kevin Laeufer <laeufer@cs.berkeley.edu>

package instrumentation

import firrtl.annotations._
import firrtl.options._
import firrtl.passes.memlib.VerilogMemDelays
import firrtl.stage.RunFirrtlTransformAnnotation
import firrtl.transforms.{NoCircuitDedupAnnotation, PropagatePresetAnnotations}

final class InstrumentationFlags extends RegisteredLibrary {
  override def name = "Bug Mining Instrumentation Options"

  override def options = Seq(
    new ShellOption[Unit](
      longOption = "line-coverage",
      toAnnotationSeq = _ => Seq(RunFirrtlTransformAnnotation(Dependency(LineCoverPass))),
      helpText = "enable line coverage instrumentation"
    ),
    new ShellOption[Unit](
      longOption = "mux-control-coverage",
      toAnnotationSeq = _ =>  Seq(RunFirrtlTransformAnnotation(Dependency(MuxControlSignalPass))),
      helpText = "enable coverage instrumentation for mux control signals"
    ),
    new ShellOption[Unit](
      longOption = "compare-coverage",
      toAnnotationSeq = _ =>  Seq(RunFirrtlTransformAnnotation(Dependency(CompareCoverPass))),
      helpText = "enable coverage instrumentation for results of comparisons"
    ),
    new ShellOption[Unit](
      longOption = "expose-cover-signals",
      toAnnotationSeq = _ =>  Seq(
        RunFirrtlTransformAnnotation(Dependency(ExposeSignalsOfInterestPass)),
        // expose cover signals only really works if deduplication is disabled
        NoCircuitDedupAnnotation,
      ),
      helpText = "collect all cover signals in an external SignalTracker module"
    ),
    new ShellOption[Unit](
      longOption = "init-to-zero",
      toAnnotationSeq = _ =>  Seq(
        // make sure that all memories and registers are initialized to zero
        RunFirrtlTransformAnnotation(Dependency(InitialStateValuePass)),
        // we have to schedule this pass explicitly in order to make sure that
        // the initial state value pass can run _after_
        RunFirrtlTransformAnnotation(Dependency(VerilogMemDelays))
      ),
      helpText = "initialize all state to zero"
    ),
    new ShellOption[Unit](
      longOption = "drive-reset",
      toAnnotationSeq = _ =>  Seq(
        RunFirrtlTransformAnnotation(Dependency(AddResetDriverPass)),
        // required by reset driver pass
        RunFirrtlTransformAnnotation(Dependency[PropagatePresetAnnotations]),
      ),
      helpText = "removes the reset pin from the top-level and adds a driver that will keep it high for one cycle"
    ),
    new ShellOption[String](
      longOption = "do-not-init",
      toAnnotationSeq = a => Seq(DoNotInitAnnotation(parseRefTarget(a))),
      helpText = "prevents a memory from being initialized to zero by the --init-to-zero option",
    ),
    new ShellOption[String](
      longOption = "do-not-cover",
      toAnnotationSeq = a => Seq(DoNotCoverAnnotation(parseModuleTarget(a))),
      helpText = "select module which should not be instrumented with coverage",
      helpValueName = Some("<circuit:module>")
    ),
  )

  private def parseRefTarget(a: String): ReferenceTarget = {
    val parts = a.trim.split(':').toSeq
    parts match {
      case Seq(circuit, module, ref) => CircuitTarget(circuit.trim).module(module.trim).ref(ref.trim)
      case _ => throw new RuntimeException(s"Expected format: <circuit:module>, not: $a")
    }
  }

  private def parseModuleTarget(a: String): ModuleTarget = {
    val parts = a.trim.split(':').toSeq
    parts match {
      case Seq(circuit, module) => CircuitTarget(circuit.trim).module(module.trim)
      case _ => throw new RuntimeException(s"Expected format: <circuit:module>, not: $a")
    }
  }
}
