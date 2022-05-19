// Copyright 2021-2022 The Regents of the University of California
// released under BSD 3-Clause License
// author: Kevin Laeufer <laeufer@cs.berkeley.edu>

package instrumentation

import firrtl._
import firrtl.annotations._
import firrtl.options.Dependency
import firrtl.passes.memlib.VerilogMemDelays
import firrtl.stage.Forms
import firrtl.transforms.PropagatePresetAnnotations

import scala.collection.mutable

/** marks a memory or register that should not be initialized by the [[InitialStateValuePass]] */
case class DoNotInitAnnotation(target: ReferenceTarget) extends SingleTargetAnnotation[ReferenceTarget] {
  override def duplicate(n: ReferenceTarget): DoNotInitAnnotation = DoNotInitAnnotation(n)
}

/** ensures that every state is assigned an initial value */
object InitialStateValuePass extends Transform with DependencyAPIMigration {
  override def invalidates(a: Transform) = false
  override def prerequisites = Forms.LowForm

  override def optionalPrerequisites = Seq(
    Dependency[PropagatePresetAnnotations],
    // mem-delays adds pipeline registers, so we want to run after
    Dependency(VerilogMemDelays)
  )

  override def optionalPrerequisiteOf = Forms.LowEmitters

  override def execute(state: CircuitState): CircuitState = {
    val main = state.circuit.main
    val existing = state.annotations.collect {
      case PresetRegAnnotation(t) if t.circuit == main =>
        t.module -> t.ref
      case MemoryScalarInitAnnotation(t, _) if t.circuit == main =>
        t.module -> t.ref
      case MemoryArrayInitAnnotation(t, _) if t.circuit == main =>
        t.module -> t.ref
      case DoNotInitAnnotation(t) if t.circuit == main =>
        t.module -> t.ref
    }.groupBy(_._1)

    var annos = List[Annotation]()
    val c = CircuitTarget(main)
    val modules = state.circuit.modules.map {
      case m: ir.Module =>
        val (mod, as) = onModule(existing.getOrElse(m.name, List()).map(_._2).toSet, c)(m)
        annos = as ++: annos
        mod
      case other => other
    }

    val circuit = state.circuit.copy(modules = modules)
    val annotations = annos ++: state.annotations
    state.copy(circuit = circuit, annotations = annotations)
  }

  private case class Ctx(
    m:        ModuleTarget,
    existing: Set[String],
    annos:    mutable.ListBuffer[Annotation] = mutable.ListBuffer())

  private def onModule(existing: Set[String], c: CircuitTarget)(m: ir.Module): (ir.DefModule, Seq[Annotation]) = {
    val ctx = Ctx(c.module(m.name), existing)
    val mod = m.mapStmt(onStmt(ctx))
    (mod, ctx.annos.toList)
  }

  private def onStmt(ctx: Ctx)(s: ir.Statement): ir.Statement = s match {
    case r: ir.DefRegister if !ctx.existing(r.name) =>
      // assert(r.init.serialize == r.name, s"unexpected register init: ${r.serialize}")
      val anno = PresetRegAnnotation(ctx.m.ref(r.name))
      ctx.annos.append(anno)
      r.copy(init = Utils.getGroundZero(r.tpe.asInstanceOf[ir.GroundType]))
    case m: ir.DefMemory if !ctx.existing(m.name) =>
      val anno = MemoryScalarInitAnnotation(ctx.m.ref(m.name), BigInt(0))
      ctx.annos.append(anno)
      m
    case other => other.mapStmt(onStmt(ctx))
  }

}
