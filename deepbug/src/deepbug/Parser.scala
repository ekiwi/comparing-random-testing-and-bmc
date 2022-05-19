package deepbug

import scopt.OptionParser

case class Config(
  design:       String = "",
  designParams: Map[String, String] = Map(),
  method:       String = "",
  harness:      String = "",
  timeout:      Long = -1,
  rand:         RandomConfig = RandomConfig()) {
  def getName: String = {
    val suffix = method match {
      case ""       => Seq()
      case "reveal" => Seq()
      case "random" => Seq(rand.getName)
      case "bmc"    => Seq()
    }
    val p = designParams.toSeq.sortBy(_._1).map { case (a, b) => s"$a=$b" }
    (design +: p :+ method :+ ("harness=" + harness) :++ suffix).mkString("_")
  }
}

case class RandomConfig(
  seeds:       Seq[Int] = Seq(),
  maxCycles:   Option[Int] = None,
  maxRestarts: Option[Int] = None) {
  def getName: String = {
    (maxCycles.map(c => s"cycles=$c") ++ maxRestarts.map(r => s"restarts=$r")).mkString("_")
  }
  def get: (Seq[Int], Int, Int) = {
    require(seeds.nonEmpty, "missing seed")
    require(maxCycles.nonEmpty, "missing max cycles")
    require(maxRestarts.nonEmpty, "missing max restarts")
    (seeds, maxCycles.get, maxRestarts.get)
  }
}

class DeepBugParser extends OptionParser[Config]("deepbug") {
  head("deepbug", "0.x")

  opt[String]("design")
    .required()
    .action { (a, config) =>
      val info = parseDesign(a)
      config.copy(design = info.name, designParams = info.params)
    }
    .text("specify the design under test + parameters")
  opt[String]("method")
    .required()
    .action((a, config) => config.copy(method = a))
    .text("random or bmc")
  opt[String]("harness")
    .required()
    .action((a, config) => config.copy(harness = a))
    .text("formal, software or universal")
  opt[Long]("timeout")
    .action((a, config) => config.copy(timeout = a))
    .text("timeout in seconds")
  opt[BigInt]("seed").action { (a, config) =>
    val seeds = config.rand.seeds :+ a.toInt
    config.copy(rand = config.rand.copy(seeds = seeds))
  }
    .text("random seed")
  opt[String]("gen-seed").action { (a, config) =>
    val newSeeds: Seq[Int] = a.split(':').toSeq match {
      case Seq(start, count) =>
        val rnd = new scala.util.Random(start.toLong)
        Seq.tabulate(count.toInt)(_ => rnd.nextInt())
      case other => throw new RuntimeException(s"invalid gen-seeds: $other")
    }
    val seeds = config.rand.seeds ++ newSeeds
    config.copy(rand = config.rand.copy(seeds = seeds))
  }
    .text("random seed")
  opt[Int]("cycles")
    .action((a, config) => config.copy(rand = config.rand.copy(maxCycles = Some(a))))
    .text("maximum number of random testing cycles")
  opt[Int]("restarts")
    .action((a, config) => config.copy(rand = config.rand.copy(maxRestarts = Some(a))))
    .text("maximum number of restarts when random testing")

  private case class DesignInfo(name: String, params: Map[String, String])
  private def parseDesign(design: String): DesignInfo = {
    require(design.nonEmpty, "empty design")
    design.split(':').map(_.trim).toList match {
      case head :: tail =>
        DesignInfo(name = head, params = tail.map(parseParam).toMap)
    }
  }

  private def parseParam(param: String): (String, String) = param.split('=').toSeq match {
    case Seq(key, value) => key -> value
    case other           => throw new RuntimeException(s"unexpected parameter: `$param``")
  }
}
