// Copyright 2021-2022 The Regents of the University of California
// released under BSD 3-Clause License
// author: Kevin Laeufer <laeufer@cs.berkeley.edu>

package instrumentation

import firrtl._
import firrtl.analyses.InstanceKeyGraph
import firrtl.ir.UIntLiteral
import firrtl.options.Dependency
import firrtl.stage.Forms

import scala.collection.mutable

/** Exposes all signals of interest in a top-level module without the use of the wiring pass. */
object ExposeSignalsOfInterestPass extends Transform with DependencyAPIMigration {
  val SignalTrackerDefaultName = "SignalTracker"
  private val SignalTrackerDefaultInstanceName = "tracker"
  /** the delimiter needs to be a valid identifier character. "_" does not work because it breaks the uniquify assumption */
  private val Delim = "__"

  override def prerequisites = Seq(
    Dependency[firrtl.transforms.RemoveWires],
    Dependency(passes.ExpandWhens),
    Dependency(passes.LowerTypes)
  )
  override def invalidates(a: Transform): Boolean = false

  private val Optimizations = Seq(
    Dependency[firrtl.transforms.ConstantPropagation],
    Dependency(passes.CommonSubexpressionElimination),
    Dependency[firrtl.transforms.DeadCodeElimination]
  )

  // need to run _before_ optimizations, because otherwise, the whole circuit might be dead code eliminated
  override def optionalPrerequisiteOf = Forms.LowEmitters
  override def optionalPrerequisites = Optimizations

  override def execute(state: CircuitState): CircuitState = {
    // determine the name of the tracker module
    val moduleNames = Namespace(state.circuit.modules.map(_.name))
    val signalTrackerName = moduleNames.newName(SignalTrackerDefaultName)

    // visit modules from bottom to top and wire up the signals of interest
    val iGraph = InstanceKeyGraph(state.circuit)
    val moduleOrderBottomUp = iGraph.moduleOrder.reverseIterator.toSeq
    val modInfo = mutable.HashMap[String, ModuleInfo]()
    var signals: Seq[Signal] = Seq()
    val modules = moduleOrderBottomUp.flatMap { dm =>
      if (dm.name == state.circuit.main) {
        val (m, sigs) = onMainModule(dm.asInstanceOf[ir.Module], modInfo, signalTrackerName)
        signals = sigs
        m
      } else {
        val (m, info) = onModule(dm, modInfo)
        modInfo(m.name) = info
        Seq(m)
      }
    }

    // print all gathered signals
    if(false) {
      println(s"Found ${signals.length} signals!\n")
      signals.foreach { sig =>
        println(s"${sig.name.replace(Delim, ".")}: ${sig.expr.serialize}")
      }
    }

    // write signals to file
    val targetDir = state.annotations.collectFirst{ case firrtl.options.TargetDirAnnotation(td) => td }
    targetDir match {
      case Some(value) =>
        val targetDir = os.pwd / os.RelPath(value)
        writeMetaData(targetDir / (state.circuit.main + ".inst.json"), signals)
      case None =>
    }

    val circuit = state.circuit.copy(modules = modules.toSeq)
    val newAnnos = Seq()

    state.copy(circuit = circuit, annotations = newAnnos ++: state.annotations)
  }

  private def onMainModule(
    m:                 ir.Module,
    getInfo:           String => ModuleInfo,
    signalTrackerName: String
  ): (Seq[ir.DefModule], Seq[Signal]) = {
    val namespace = Namespace(m)
    val (body, signals) = gatherSignals(m, getInfo, namespace)

    // create ports for the signal tracker
    val signalPorts = signals.map(s => ir.Port(ir.NoInfo, s.localRef.serialize.replace(".", Delim), ir.Input, s.tpe))
    val trackerPorts = Seq(
      ir.Port(ir.NoInfo, "clock", ir.Input, ir.ClockType),
      ir.Port(ir.NoInfo, "reset", ir.Input, Utils.BoolType)
    ) ++ signalPorts

    // create signal tracker
    val trackerMod = ir.ExtModule(ir.NoInfo, signalTrackerName, trackerPorts, signalTrackerName, Seq())

    // create signal tracker instance
    val trackerInstance = ir.DefInstance(
      ir.NoInfo,
      namespace.newName(SignalTrackerDefaultInstanceName),
      signalTrackerName,
      ir.BundleType(trackerPorts.map(p => ir.Field(p.name, ir.Flip, p.tpe)))
    )
    val trackerRef = ir.Reference(trackerInstance).copy(flow = SourceFlow)
    val trackerClockResetCons = Seq(
      ir.Connect(ir.NoInfo, ir.SubField(trackerRef, "clock", ir.ClockType, SinkFlow),
        ir.Reference("clock", ir.ClockType, PortKind, SourceFlow)),
      ir.Connect(ir.NoInfo, ir.SubField(trackerRef, "reset", Utils.BoolType, SinkFlow),
        ir.Reference("reset", Utils.BoolType, PortKind, SourceFlow))
    )
    val trackerCons = signalPorts.zip(signals).map {
      case (p, sig) =>
        ir.Connect(ir.NoInfo, ir.SubField(trackerRef, p.name, p.tpe, SinkFlow), sig.localRef)
    }
    val mainBody = ir.Block(body +: trackerInstance +: trackerClockResetCons ++: trackerCons)

    (Seq(m.copy(body = mainBody), trackerMod), signals)
  }

  private def writeMetaData(filename: os.Path, signals: Seq[Signal]): Unit = {
    val sigs = signals.map{ s =>
      val name = s.localRef.serialize.replace(".", Delim)
      val expr = s.expr.serialize.replace("\"", "\\\"")
      s"""  {"name": "$name", "expr": "$expr"}"""
    }.mkString("[\n", ",\n", "\n]\n")
    os.write.over(filename, sigs)
  }

  private case class Signal(name: String, expr: ir.Expression, localRef: ir.Expression) {
    require(expr.tpe == ir.UnknownType || expr.tpe == localRef.tpe,
      s"${expr.tpe.serialize} vs ${localRef.tpe.serialize}")
    val tpe = localRef.tpe.asInstanceOf[ir.GroundType]
  }
  private case class ModuleInfo(signals: Seq[Signal])

  private def onModule(dm: ir.DefModule, getInfo: String => ModuleInfo): (ir.DefModule, ModuleInfo) = dm match {
    case m: ir.Module =>
      val namespace = Namespace(dm)
      val (body, signals) = gatherSignals(m, getInfo, namespace)

      // create ports
      val refsAndPorts = signals.map { sig =>
        val name = namespace.newName(sig.localRef.serialize.replace(".", Delim))
        sig.localRef -> ir.Port(ir.NoInfo, name, ir.Output, sig.tpe)
      }
      val ports = m.ports ++ refsAndPorts.map(_._2)
      val portCons = refsAndPorts.map {
        case (ref, port) =>
          ir.Connect(ir.NoInfo, ir.Reference(port.name, port.tpe, PortKind, SinkFlow), ref)
      }
      val mod = m.copy(ports = ports, body = ir.Block(body +: portCons))

      val signalInfo = refsAndPorts.map(_._2).zip(signals).map{ case (port, signal) =>
        signal.copy(name = port.name)
      }
      (mod, ModuleInfo(signalInfo))

    case other => (other, ModuleInfo(List()))
  }

  private def gatherSignals(
    m:         ir.Module,
    getInfo:   String => ModuleInfo,
    namespace: Namespace
  ): (ir.Statement, Seq[Signal]) = {
    // add extra ports to instances
    val instanceSignals = mutable.ListBuffer[Signal]()
    val body = patchInstances(getInfo, instanceSignals)(m.body)

    // find local signals of interest
    val (localSignals, body2) = findCoverConditions(body)
    val (nodes, localSignalRefs) = expressionsToRefs(namespace, "cover", localSignals)

//    println(s"In ${m.name}")
//    localSignalRefs.foreach { s =>
//     println(s"${s.localRef.serialize}: ${s.expr.serialize}")
//    }
//    println()

    (ir.Block(body2, nodes), instanceSignals.toList ++ localSignalRefs)
  }

  private def patchInstances(
    getInfo:         String => ModuleInfo,
    instanceSignals: mutable.ListBuffer[Signal]
  )(stmt:            ir.Statement
  ): ir.Statement = stmt match {
    case ir.DefInstance(info, name, module, oldTpe) =>
      val signals = getInfo(module).signals
      // add signals to module type definition
      val fields = oldTpe.asInstanceOf[ir.BundleType].fields ++
        signals.map ( sig => ir.Field(sig.name, ir.Default, sig.tpe) )
      val tpe = ir.BundleType(fields)
      val ref = ir.Reference(name, tpe, InstanceKind, SourceFlow)
      // record new local references
      val newSignals = signals.map(updateInstanceSignal(ref, _))
      instanceSignals ++= newSignals
      ir.DefInstance(info, name, module, tpe)
    case other => other.mapStmt(patchInstances(getInfo, instanceSignals))
  }

  private def updateInstanceSignal(instRef: ir.Reference, sig: Signal): Signal = {
    // the signal is new referenced as an output of the instance
    val localRef = ir.SubField(instRef, sig.name, sig.tpe, SourceFlow)
    // we need to update the expression in order to qualify local references
    // note: this won't normally result in valid firrtl since we are creating references to
    //       module private signals, so this expression can only really be used to generate a
    //       human readable expression at the end
    val expr = prefixRefs(instRef.name)(sig.expr)
    sig.copy(localRef = localRef, expr = expr)
  }

  private def prefixRefs(prefix: String)(e: ir.Expression): ir.Expression = e match {
    case ir.Reference(name, _, _, _) =>
      ir.SubField(ir.Reference(prefix), name)
    case other => other.mapExpr(prefixRefs(prefix))
  }

  /** fills in the localRef field for each new signal */
  private def expressionsToRefs(
    namespace: Namespace,
    prefix:    String,
    signals:     Seq[Signal]
  ): (ir.Statement, Seq[Signal]) = {
    val refsAndStmts = signals.map { s => s.localRef match {
      case ref: ir.RefLikeExpression => (s.copy(name = ref.serialize), None)
      case other =>
        val node = ir.DefNode(ir.NoInfo, namespace.newName(prefix), other)
        val ref = ir.Reference(node.name, node.value.tpe, NodeKind, SourceFlow)
        (s.copy(localRef = ref, name = ref.name), Some(node))
    }}
    (ir.Block(refsAndStmts.flatMap(_._2)), refsAndStmts.map(_._1))
  }

  // returns a list of unique (at least structurally unique!) mux conditions used in the module
  private def findCoverConditions(body: ir.Statement): (Seq[Signal], ir.Statement) = {
    val signals = mutable.HashMap[String, Signal]()
    val netlist = mutable.HashMap[String, ir.Expression]()

    def onStmt(s: ir.Statement): ir.Statement = s match {
      case n @ ir.DefNode(_, name, value) =>
        netlist(name) = value
        n
      case v : ir.Verification if v.op == ir.Formal.Cover =>
        v.en match {
          case Utils.False() => // never enabled
          case other =>
            val cond = Utils.implies(other, v.pred)
            cond match {
              case _: UIntLiteral => // ignore
              case cond =>
                val expanded =  expand(cond, 3) // expand up to 3 levels of expressions
                val key = expanded.serialize
                val sig = Signal("", expanded, cond)
                signals(key) = sig
            }
        }
        ir.EmptyStmt
      case other  => other.mapStmt(onStmt)
    }
    def expand(e: ir.Expression, gas: Int): ir.Expression = e match {
      case e : ir.RefLikeExpression =>
        netlist.get(e.serialize) match {
          case Some(value) =>
            if(gas > 0) { expand(value, gas - 1) } else { e }
          case None => e
        }
      case other => other.mapExpr(expand(_, gas))
    }
    val body2 = onStmt(body)
    // make sure signal order is always deterministic despite the fact that we use a map to keep track of signals!
    val condList = signals.values.toList.sortBy(_.name)
    (condList, body2)
  }
}
