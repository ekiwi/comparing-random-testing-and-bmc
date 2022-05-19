// Copyright 2017-2022 The Regents of the University of California
// released under BSD 3-Clause License
// author: Jack Koenig <koenig@sifive.com>, Kevin Laeufer <laeufer@cs.berkeley.edu>,

package instrumentation

import firrtl._
import firrtl.annotations._
import firrtl.options.Dependency
import firrtl.stage.Forms
import firrtl.transforms.DontTouchAnnotation

import scala.collection.mutable

/** Tags a module that should not have any coverage added.
  *  This annotation should be respected by all automated coverage passes.
  */
case class DoNotCoverAnnotation(target: ModuleTarget) extends SingleTargetAnnotation[ModuleTarget] {
  override def duplicate(n: ModuleTarget) = copy(target = n)
}

// adds a cover statement for every possible mux control signal
// based on ideas in: https://people.eecs.berkeley.edu/~laeufer/papers/rfuzz_kevin_laeufer_iccad2018.pdf
object MuxControlSignalPass extends CoverExpressionsPass {
  protected val Prefix = "mux"

  // returns a list of unique (at least structurally unique!) mux conditions used in the module
  protected def findCovers(m: ir.Module): List[ir.Expression] = {
    val conds = mutable.LinkedHashMap[String, ir.Expression]()

    def onCond(cond: ir.Expression): Unit = {
      val key = cond.serialize
      conds(key) = cond
    }
    def onStmt(s: ir.Statement): Unit = {
      s.foreachStmt(onStmt)
      s.foreachExpr(onExpr)
      s match {
        case ir.Conditionally(_, pred, _, _) => onCond(pred)
        case _ =>
      }
    }
    def onExpr(e: ir.Expression): Unit = {
      e.foreachExpr(onExpr)
      e match {
        case ir.Mux(cond, _, _, _) => onCond(cond)
        case ir.ValidIf(cond, _, _) => onCond(cond)
        case _ =>
      }
    }
    onStmt(m.body)
    conds.values.toList
  }
}
