// Copyright 2021-2022 The Regents of the University of California
// released under BSD 3-Clause License
// author: Kevin Laeufer <laeufer@cs.berkeley.edu>

package instrumentation

import chisel3.util.log2Ceil
import firrtl._
import firrtl.annotations.{IsModule, ReferenceTarget}
import logger.Logger

import scala.collection.mutable

/** Helps us construct well typed low-ish firrtl.
  * Some of these convenience functions could be moved to firrtl at some point.
  */
object Builder {

  /** Fails if there isn't exactly one Clock input */
  def findClock(m: ir.Module): ir.RefLikeExpression = {
    val clocks = findClocks(m)
    assert(
      clocks.length == 1,
      s"[${m.name}] This transformation only works if there is exactly one clock.\n" +
        s"Found: ${clocks.map(_.serialize)}\n"
    )
    clocks.head
  }

  def findClock(mod: ir.Module, logger: Logger): Option[ir.RefLikeExpression] = {
    val clocks = Builder.findClocks(mod)
    if (clocks.isEmpty) {
      logger.warn(s"WARN: [${mod.name}] found no clock input, skipping ...")
    }
    if (clocks.length > 1) {
      logger.warn(
        s"WARN: [${mod.name}] found more than one clock, picking the first one: " + clocks
          .map(_.serialize)
          .mkString(", ")
      )
    }
    clocks.headOption
  }

  def findClocks(m: ir.Module): Seq[ir.RefLikeExpression] = {
    val ports = flattenedPorts(m.ports)
    val clockIO = ports.filter(_.tpe == ir.ClockType)
    clockIO.filter(_.flow == SourceFlow)
  }

  def refToTarget(module: IsModule, ref: ir.RefLikeExpression): ReferenceTarget = ref match {
    case ir.Reference(name, _, _, _)    => module.ref(name)
    case ir.SubField(expr, name, _, _)  => refToTarget(module, expr.asInstanceOf[ir.RefLikeExpression]).field(name)
    case ir.SubIndex(expr, value, _, _) => refToTarget(module, expr.asInstanceOf[ir.RefLikeExpression]).index(value)
    case other                          => throw new RuntimeException(s"Unsupported reference expression: $other")
  }

  private def flattenedPorts(ports: Seq[ir.Port]): Seq[ir.RefLikeExpression] = {
    ports.flatMap { p => expandRef(ir.Reference(p.name, p.tpe, PortKind, Utils.to_flow(p.direction))) }
  }

  private def expandRef(ref: ir.RefLikeExpression): Seq[ir.RefLikeExpression] = ref.tpe match {
    case ir.BundleType(fields) =>
      Seq(ref) ++ fields.flatMap(f => expandRef(ir.SubField(ref, f.name, f.tpe, Utils.times(f.flip, ref.flow))))
    case _ => Seq(ref)
  }

  /** Fails if there isn't exactly one reset input */
  def findReset(m: ir.Module): ir.RefLikeExpression = {
    val resets = findResets(m)
    assert(
      resets.length == 1,
      s"[${m.name}] This transformation only works if there is exactly one reset.\n" +
        s"Found: ${resets.map(_.serialize)}\n"
    )
    resets.head
  }

  def findResets(m: ir.Module): Seq[ir.RefLikeExpression] = {
    val ports = flattenedPorts(m.ports)
    val inputs = ports.filter(_.flow == SourceFlow)
    val ofResetType = inputs.filter(p => p.tpe == ir.AsyncResetType || p.tpe == ir.ResetType)
    val boolWithCorrectName = inputs.filter(p => p.tpe == ir.UIntType(ir.IntWidth(1)) && p.serialize.endsWith("reset"))
    val resetInputs = ofResetType ++ boolWithCorrectName
    resetInputs
  }

  def reduceAnd(e: ir.Expression): ir.Expression = ir.DoPrim(PrimOps.Andr, List(e), List(), Utils.BoolType)

  def add(a: ir.Expression, b: ir.Expression): ir.Expression = {
    val (aWidth, bWidth) = (getWidth(a.tpe), getWidth(b.tpe))
    val resultWidth = Seq(aWidth, bWidth).max
    val (aPad, bPad) = (pad(a, resultWidth), pad(b, resultWidth))
    val res = ir.DoPrim(PrimOps.Add, List(aPad, bPad), List(), withWidth(a.tpe, resultWidth + 1))
    ir.DoPrim(PrimOps.Bits, List(res), List(resultWidth - 1, 0), withWidth(a.tpe, resultWidth))
  }

  def pad(e: ir.Expression, to: BigInt): ir.Expression = {
    val from = getWidth(e.tpe)
    require(to >= from)
    if (to == from) { e }
    else { ir.DoPrim(PrimOps.Pad, List(e), List(to), withWidth(e.tpe, to)) }
  }

  def withWidth(tpe: ir.Type, width: BigInt): ir.Type = tpe match {
    case ir.UIntType(_) => ir.UIntType(ir.IntWidth(width))
    case ir.SIntType(_) => ir.SIntType(ir.IntWidth(width))
    case other          => throw new RuntimeException(s"Cannot change the width of $other!")
  }

  def getWidth(tpe: ir.Type): BigInt = firrtl.bitWidth(tpe)

  /** Creates a register in canonical form from LoFirrtl expressions. */
  def makeRegister(
    info:  ir.Info,
    name:  String,
    clock: ir.Expression,
    reset: ir.Expression,
    next:  Option[ir.Expression],
    init:  Option[ir.Expression]
  ): (ir.Reference, ir.DefRegister, ir.Statement) = {
    require(clock.tpe == ir.ClockType, s"Invalid clock expression: ${clock.serialize} : ${clock.tpe.serialize}")
    val hasAsyncReset = reset.tpe match {
      case ir.AsyncResetType => true
      case ir.UIntType(_)    => false
      case other             => throw new RuntimeException(s"Invalid reset expression: ${reset.serialize} : ${other.serialize}")
    }
    val tpe: ir.Type = (next, init) match {
      case (None, None) =>
        throw new RuntimeException("You need to specify at least one, either an init or a next expression!")
      case (Some(n), None) => n.tpe
      case (None, Some(i)) => i.tpe
      case (Some(n), Some(i)) =>
        require(
          n.tpe == i.tpe,
          s"Reset and init expression need to be of the same type, not: ${n.tpe.serialize} vs. ${i.tpe.serialize}"
        )
        n.tpe
    }
    val sourceRef = ir.Reference(name, tpe, RegKind, SourceFlow)
    val sinkRef = sourceRef.copy(flow = SinkFlow)

    // we make sure to construct the register as if it was normalized by the RemoveResets pass
    val (resetExpr, initExpr) = (hasAsyncReset, init) match {
      case (true, Some(i)) => (reset, i)
      case _               => (Utils.False(), sourceRef)
    }

    val reg = ir.DefRegister(info, name, tpe, clock, resetExpr, initExpr)
    val con = (hasAsyncReset, next, init) match {
      case (true, None, _)           => ir.EmptyStmt
      case (true, Some(n), _)        => ir.Connect(info, sinkRef, n)
      case (false, None, Some(i))    => ir.Connect(info, sinkRef, i)
      case (false, Some(n), None)    => ir.Connect(info, sinkRef, n)
      case (false, Some(n), Some(i)) => ir.Connect(info, sinkRef, Utils.mux(reset, i, n))
      case other                     => throw new RuntimeException(s"Invalid combination! $other")
    }
    (sourceRef, reg, con)
  }

  def isAsyncReset(reset: ir.Expression): Boolean = reset.tpe match {
    case ir.AsyncResetType => true
    case _                 => false
  }

  def getKind(ref: ir.RefLikeExpression): firrtl.Kind = ref match {
    case ir.Reference(_, _, kind, _) => kind
    case ir.SubField(expr, _, _, _)  => getKind(expr.asInstanceOf[ir.RefLikeExpression])
    case ir.SubIndex(expr, _, _, _)  => getKind(expr.asInstanceOf[ir.RefLikeExpression])
    case ir.SubAccess(expr, _, _, _) => getKind(expr.asInstanceOf[ir.RefLikeExpression])
  }

  def plusOne(e: ir.Expression): ir.Expression = {
    val width = e.tpe.asInstanceOf[ir.UIntType].width.asInstanceOf[ir.IntWidth].width
    val addTpe = ir.UIntType(ir.IntWidth(width + 1))
    val add = ir.DoPrim(PrimOps.Add, List(e, ir.UIntLiteral(1, ir.IntWidth(width))), List(), addTpe)
    ir.DoPrim(PrimOps.Bits, List(add), List(width - 1, 0), e.tpe)
  }

  def makeSaturatingCounter(
    info:       ir.Info,
    name:       String,
    activeName: String,
    maxValue:   Int,
    clock:      ir.Expression,
    reset:      ir.Expression
  ): (ir.Reference, ir.Reference, Seq[ir.Statement]) = {
    require(maxValue > 0)
    val tpe = ir.UIntType(ir.IntWidth(List(1, log2Ceil(maxValue + 1)).max))
    val init = Utils.getGroundZero(tpe)
    val ref = ir.Reference(name, tpe, RegKind, SourceFlow)
    // the counter is active, iff it is less than the maxValue
    val lessThan = ir.DoPrim(PrimOps.Lt, List(ref, ir.UIntLiteral(maxValue, tpe.width)), List(), Utils.BoolType)
    val isActiveNode = ir.DefNode(info, activeName, lessThan)
    val isActive = ir.Reference(isActiveNode).copy(flow = SourceFlow)
    // increment the counter iff it is active, otherwise just keep the last value
    val next = Utils.mux(isActive, plusOne(ref), ref)
    val (_, reg, regNext) = makeRegister(info, name, clock, reset, next = Some(next), init = Some(init))
    (ref, isActive, Seq(reg, isActiveNode, regNext))
  }
}
