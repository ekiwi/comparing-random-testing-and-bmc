package deepbug

import firrtl.{bitWidth, ir}

/** Contains information about the top-level module in the circuit being simulated. */
case class TopmoduleInfo(
  name:    String,
  inputs:  Seq[PinInfo],
  outputs: Seq[PinInfo],
  clocks:  Seq[String]) {
  require(inputs.forall(_.width > 0), s"Inputs need to be at least 1-bit!\n$inputs")
  require(outputs.forall(_.width > 0), s"Outputs need to be at least 1-bit!\n$outputs")
  def portNames: Seq[String] = inputs.map(_.name) ++ outputs.map(_.name) ++ clocks
  def requireNoMultiClock(): Unit = {
    require(
      clocks.size <= 1,
      s"Circuit $name has more than one top-level clock input: " + clocks.mkString(", ") + ".\n" +
        "Unfortunately multi-clock circuits are currently not supported.\n" +
        "Consider creating a wrapper with a single input clock."
    )
  }
}

case class PinInfo(name: String, width: Int, signed: Boolean)

object TopmoduleInfo {
  def apply(circuit: ir.Circuit): TopmoduleInfo = {
    val main = circuit.modules.find(_.name == circuit.main).get

    // extract ports
    // clock outputs are treated just like any other output
    def isClockIn(p: ir.Port): Boolean = p.tpe == ir.ClockType && p.direction == ir.Input
    val (clock, notClock) = main.ports.partition(isClockIn)
    val (in, out) = notClock.filterNot(p => bitWidth(p.tpe) == 0).partition(_.direction == ir.Input)

    new TopmoduleInfo(
      name = main.name,
      inputs = in.map(portNameAndWidthAndIsSigned),
      outputs = out.map(portNameAndWidthAndIsSigned),
      clocks = clock.map(_.name)
    )
  }

  private def portNameAndWidthAndIsSigned(p: ir.Port): PinInfo = {
    require(
      p.tpe.isInstanceOf[ir.GroundType],
      s"Port ${p.serialize} is not of ground type! Please make sure to provide LowFirrtl to this API!"
    )
    PinInfo(p.name, bitWidth(p.tpe).toInt, p.tpe.isInstanceOf[ir.SIntType])
  }
}
