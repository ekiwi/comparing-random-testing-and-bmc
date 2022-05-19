// Copyright 2021-2022 The Regents of the University of California
// released under BSD 3-Clause License
// author: Kevin Laeufer <laeufer@cs.berkeley.edu>,

package instrumentation

import firrtl._
import firrtl.stage.Forms
import logger.LazyLogging

abstract class CoverExpressionsPass extends Transform with DependencyAPIMigration with LazyLogging {
  override def prerequisites = Forms.HighForm
  override def invalidates(a: Transform) = false
  override def optionalPrerequisiteOf = Forms.LowEmitters
  override def optionalPrerequisites = Seq()

  override def execute(state: CircuitState): CircuitState = {
    val circuit = state.circuit.mapModule(onModule(_, collectModulesToIgnore(state)))
    state.copy(circuit = circuit)
  }

  protected def Prefix: String

  private def onModule(
    m:         ir.DefModule,
    ignoreSet: Set[String],
  ): ir.DefModule = m match {
    case mod: ir.Module if !ignoreSet.contains(mod.name) =>
      Builder.findClock(mod, logger) match {
        case Some(clock) =>
          val namespace = Namespace(mod)
          namespace.newName(Prefix)
          val conds = findCovers(mod)
          val covers = conds.flatMap { cond =>
            val (node, ref) = cond match {
              case ref: ir.RefLikeExpression => (Seq(), ref)
              case other =>
                val node = ir.DefNode(ir.NoInfo, namespace.newName(Prefix + "_node"), other)
                (Seq(node), ir.Reference(node).copy(flow = SourceFlow))
            }
            val cov = ir.Verification(
              ir.Formal.Cover,
              ir.NoInfo,
              clock,
              ref,
              Utils.True(),
              ir.StringLit(""),
              namespace.newName(Prefix)
            )
            node ++ Seq(cov)
          }
          mod.copy(body = ir.Block(mod.body +: covers))
        case None =>
          val conds = findCovers(mod)
          logger.info(s"skipping ${conds.length} conditions")
          mod
      }

    case other => other
  }

  private def collectModulesToIgnore(state: CircuitState): Set[String] = {
    val main = state.circuit.main
    state.annotations.collect { case DoNotCoverAnnotation(target) if target.circuit == main => target.module }.toSet
  }

  protected def findCovers(m: ir.Module): List[ir.Expression]
}
