// Copyright 2021-2022 The Regents of the University of California
// released under BSD 3-Clause License
// author: Kevin Laeufer <laeufer@cs.berkeley.edu>,

package instrumentation

import firrtl._
import firrtl.annotations._
import firrtl.options.Dependency
import firrtl.stage.Forms
import firrtl.transforms.DontTouchAnnotation

import scala.collection.mutable

// adds a cover statement for every result of a comparison
object CompareCoverPass extends CoverExpressionsPass {
  protected val Prefix = "cmp"

  // returns a list of unique (at least structurally unique!) comparison results
  protected def findCovers(m: ir.Module): List[ir.Expression] = {
    val signals = mutable.LinkedHashMap[String, ir.Expression]()

    def onCond(expr: ir.Expression): Unit = {
      val key = expr.serialize
      signals(key) = expr
    }
    def onStmt(s: ir.Statement): Unit = {
      s.foreachStmt(onStmt)
      s.foreachExpr(onExpr)
    }
    def onExpr(e: ir.Expression): Unit = {
      e.foreachExpr(onExpr)
      e match {
        case p : ir.DoPrim => p.op match {
          case PrimOps.Lt | PrimOps.Leq | PrimOps.Gt | PrimOps.Geq | PrimOps.Eq | PrimOps.Neq =>
            onCond(p)
          case _ =>
        }
        case _ =>
      }
    }
    onStmt(m.body)
    signals.values.toList
  }
}
