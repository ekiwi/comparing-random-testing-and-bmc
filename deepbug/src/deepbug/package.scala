package object deepbug {
  private val prefixes = List("n", "μ", "m", "", "k", "M")

  def timeWithUnits(nanos: Long): String = timeWithUnits(nanos.toDouble)

  def timeWithUnits(nanos: Double): String = {
    var num = nanos
    prefixes.foreach { p =>
      if (num < 1000.0) {
        return f"$num%1.2f${p}s"
      }
      num /= 1000.0
    }
    throw new RuntimeException(s"ran out of prefixes for : $nanos")
  }
}
