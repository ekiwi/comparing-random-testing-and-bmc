package deepbug

import chisel3.RawModule
import circuits.{ArbitratedTop, CircularPointerFifo, DeepBug, ShiftRegisterFifo}
import deepbug.harness.{
  ArbitratedFormalHarness,
  ArbitratedSoftwareHarness,
  ArbitratedUniversalHarness,
  FifoFormalHarness,
  FifoSoftwareHarness,
  FifoUniversalHarness,
  GenericSoftwareHarness,
  TestHarness
}

object Designs {
  // design
  val DeepBug = "deepbug"
  val CircularFifo = "circular-fifo"
  val ShiftFifo = "shift-fifo"
  val Arbitrated = "arbitrated"
  // harness
  val Software = "software"
  val Universal = "universal"
  val Formal = "formal"

  def load(config: Config): () => RawModule = {
    val p = config.designParams
    val makeDut = config.design match {
      case DeepBug =>
        // deepbug has a built in assertion and no assumptions, so no need to add a harness
        () =>
          new DeepBug(
            regSize = p("depth").toInt,
            withBug = p("withBug").toBoolean
          )
      case CircularFifo | ShiftFifo =>
        val makeDut = if (config.design == CircularFifo) { () =>
          new CircularPointerFifo(
            width = p("width").toInt,
            depth = p("depth").toInt,
            fixed = !p("withBug").toBoolean
          )
        } else { () =>
          new ShiftRegisterFifo(
            width = p("width").toInt,
            depth = p("depth").toInt,
            fixed = !p("withBug").toBoolean
          )
        }

        config.harness match {
          case Software  => makeDut
          case Universal => () => new FifoUniversalHarness(makeDut())
          case Formal    => () => new FifoFormalHarness(makeDut())
        }
      case Arbitrated =>
        val makeDut =
          () =>
            new ArbitratedTop(
              numFifos = p("numFifos").toInt,
              width = p("width").toInt,
              depth = p("depth").toInt,
              fixed = !p("withBug").toBoolean
            )

        config.harness match {
          case Software  => makeDut
          case Universal => () => new ArbitratedUniversalHarness(makeDut())
          case Formal    => () => new ArbitratedFormalHarness(makeDut())
        }
      case other => throw new RuntimeException(s"Unknown dut: $other")
    }

    makeDut
  }

  def getSoftwareHarness(config: Config): (TopmoduleInfo) => TestHarness = {
    if (config.harness != Software) {
      new GenericSoftwareHarness(_)
    } else {
      config.design match {
        case DeepBug                  => new GenericSoftwareHarness(_)
        case CircularFifo | ShiftFifo => new FifoSoftwareHarness(_)
        case Arbitrated               => new ArbitratedSoftwareHarness(_)
        case other                    => throw new RuntimeException(s"Unknown dut: $other")
      }
    }
  }
}
