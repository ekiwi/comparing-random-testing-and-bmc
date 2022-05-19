// Copyright 2021-2022 The Regents of the University of California
// released under BSD 3-Clause License
// author: Kevin Laeufer <laeufer@cs.berkeley.edu>
package instrumentation

import firrtl._
import firrtl.annotations._
import firrtl.options.Dependency
import firrtl.transforms._

/** Specifies how many cycles the circuit should be reset for. */
case class ResetOption(cycles: Int = 1) extends NoTargetAnnotation {
  require(cycles >= 0, "The number of cycles must not be negative!")
}

/** adds reset driver to the toplevel module that all resets are active in the first cycle */
object AddResetDriverPass extends Transform with DependencyAPIMigration {
  // run on lowered firrtl
  override def prerequisites = Seq(
    Dependency(firrtl.passes.ExpandWhens),
    Dependency(firrtl.passes.LowerTypes),
    Dependency(firrtl.transforms.RemoveReset),
    // try to work around dead code elimination removing our registers
    Dependency[firrtl.transforms.DeadCodeElimination]
  )
  override def invalidates(a: Transform) = false
  // we want to run before the actual Verilog is emitted
  override def optionalPrerequisiteOf =
    Seq(Dependency[PropagatePresetAnnotations]) ++ firrtl.stage.Forms.BackendEmitters
  override def execute(state: CircuitState): CircuitState = {
    val resetLength = getResetLength(state.annotations)
    if (resetLength == 0 || resetIsPreset(state.circuit.main, state.annotations)) return state

    val main = state.circuit.modules.collectFirst { case m: ir.Module if m.name == state.circuit.main => m }.get
    val clock = Builder.findClock(main)
    val reset = Builder.findReset(main)
    val namespace = Namespace(main)

    // add a port for the preset init
    val preset = ir.Port(ir.NoInfo, namespace.newName("_preset"), ir.Input, ir.AsyncResetType)
    val presetAnno = PresetAnnotation(CircuitTarget(main.name).module(main.name).ref(preset.name))

    // make a saturating reset counter
    val (_, resetPhaseRef, counterStmts) = Builder.makeSaturatingCounter(
      ir.NoInfo,
      namespace.newName("_resetCount"),
      namespace.newName("_resetPhase"),
      resetLength,
      clock,
      ir.Reference(preset).copy(flow = SourceFlow)
    )

    // drive reset
    val resetNode = ir.DefNode(ir.NoInfo, "reset", resetPhaseRef)

    // remove original reset port
    val ports = main.ports.filterNot(_.name == "reset") :+ preset

    // collect all our statements and add them to the main module
    val stmts = counterStmts :+ resetNode :+ main.body
    val instrumented = main.copy(ports = ports, body = ir.Block(stmts))

    // substitute instrumented main and add annotations
    val otherMods = state.circuit.modules.filterNot(_.name == state.circuit.main)
    state.copy(
      circuit = state.circuit.copy(modules = instrumented +: otherMods),
      annotations = presetAnno +: state.annotations
    )
  }

  def getResetLength(annos: AnnotationSeq): Int = {
    annos.collect { case ResetOption(n) => n }.distinct.toList match {
      case List()    => 1 // default
      case List(one) => one
      case more =>
        throw new RuntimeException(s"Received multiple disagreeing reset options! " + more.mkString(", "))
    }
  }

  private def resetIsPreset(main: String, annos: AnnotationSeq): Boolean = {
    annos.collectFirst {
      case PresetAnnotation(target) if target.circuit == main && target.module == main && target.ref == "reset" => true
    }.getOrElse(false)
  }
}
