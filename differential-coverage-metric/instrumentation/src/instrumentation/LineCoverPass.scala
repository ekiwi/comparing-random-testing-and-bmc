// Copyright 2021-2022 The Regents of the University of California
// released under BSD 3-Clause License
// author: Kevin Laeufer <laeufer@cs.berkeley.edu>,

package instrumentation

import firrtl._
import firrtl.annotations._
import firrtl.options.Dependency
import firrtl.passes.{ExpandWhens, ExpandWhensAndCheck}
import firrtl.stage.Forms
import firrtl.stage.TransformManager.TransformDependency
import firrtl.transforms.{DedupModules, DontTouchAnnotation}

import scala.collection.mutable


// adds a cover statement for every line/branch in the chisel circuit
object LineCoverPass extends Transform with DependencyAPIMigration {
  override def prerequisites: Seq[TransformDependency] = Forms.Checks
  // we can run after deduplication which should make things faster
  override def optionalPrerequisites: Seq[TransformDependency] = Seq(Dependency[DedupModules])
  // line coverage does not work anymore after whens have been expanded
  override def optionalPrerequisiteOf: Seq[TransformDependency] =
    Seq(Dependency[ExpandWhensAndCheck], Dependency(ExpandWhens))
  override def invalidates(a: Transform): Boolean = false

  override def execute(state: CircuitState): CircuitState = {
    val circuit = state.circuit.mapModule(onModule(_, collectModulesToIgnore(state)))
    state.copy(circuit = circuit)
  }

  private def collectModulesToIgnore(state: CircuitState): Set[String] = {
    val main = state.circuit.main
    state.annotations.collect { case DoNotCoverAnnotation(target) if target.circuit == main => target.module }.toSet
  }

  private val Prefix = "line"

  private def onModule(
    m:         ir.DefModule,
    ignoreSet: Set[String],
  ): ir.DefModule = m match {
    case mod: ir.Module if !ignoreSet.contains(mod.name) =>
      Builder.findClock(mod, logger) match {
        case Some(clock) =>
          val namespace = Namespace(mod)
          namespace.newName(Prefix)
          val ctx = ModuleCtx(clock, namespace)
          // we always cover the body, even if the module only contains nodes and cover statements
          val bodyInfo = onStmt(ctx)(mod.body).copy(_2 = true)
          val body = addCover(ctx)(bodyInfo)
          mod.copy(body = body)
        case None =>
          mod
      }
    case other => other
  }

  private def onStmt(ctx: ModuleCtx)(s: ir.Statement): (ir.Statement, Boolean, Seq[ir.Info]) = s match {
    case c @ ir.Conditionally(_, _, conseq, alt) =>
      val truInfo = onStmt(ctx)(conseq)
      val falsInfo = onStmt(ctx)(alt)
      val doCover = truInfo._2 || falsInfo._2
      val stmt = c.copy(conseq = addCover(ctx)(truInfo), alt = addCover(ctx)(falsInfo))
      (stmt, doCover, List(c.info))
    case ir.Block(stmts) =>
      val s = stmts.map(onStmt(ctx))
      val block = ir.Block(s.map(_._1))
      val doCover = s.map(_._2).foldLeft(false)(_ || _)
      val infos = s.flatMap(_._3)
      (block, doCover, infos)
    case ir.EmptyStmt                                        => (ir.EmptyStmt, false, List())
    // if there is only a cover statement, we do not explicitly try to cover that line
    case v @ ir.Verification(ir.Formal.Cover, _, _, _, _, _) => (v, false, List(v.info))
    // nodes are always side-effect free, so they should not be covered unless there is another operation in the block
    case n : ir.DefNode => (n, false, List(n.info))
    case other: ir.HasInfo => (other, true, List(other.info))
    case other => (other, false, List())
  }

  private def addCover(ctx: ModuleCtx)(info: (ir.Statement, Boolean, Seq[ir.Info])): ir.Statement = {
    val (stmt, doCover, infos) = info
    if (!doCover) { stmt }
    else {
      val name = ctx.namespace.newName(Prefix)
      val cover =
        ir.Verification(ir.Formal.Cover, ir.NoInfo, ctx.clock, Utils.True(), Utils.True(), ir.StringLit(""), name)
      ir.Block(cover, stmt)
    }
  }


  private case class ModuleCtx(
    clock: ir.Expression,
    namespace: Namespace,
  )
}
