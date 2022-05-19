package deepbug.harness

/** abstract source of random numbers/decisions */
trait Rnd {
  def nextInt(n: Int): Int
  def nextBoolean(): Boolean
  def nextBytes(n: Int): Array[Byte] = {
    val bytes = new Array[Byte](0.max(n))
    nextBytes(bytes)
    bytes
  }
  def nextBytes(bytes: Array[Byte]): Unit
  def choice[T](elements: Seq[T]): T = {
    require(elements.nonEmpty)
    val index = nextInt(elements.size)
    elements(index)
  }
  def nextBigInt(width: Int): BigInt = BigInt(1, randomBits(width))
  //inspired by the method of the same name in hte BigInteger class from the Java standard library
  private def randomBits(numBits: Int): Array[Byte] = {
    require(numBits >= 0)
    val numBytes = ((numBits.toLong + 7L) / 8L).toInt
    val randomBits = new Array[Byte](numBytes)
    if (numBytes > 0) {
      nextBytes(randomBits)
      val excessBits = 8 * numBytes - numBits
      randomBits(0) = (randomBits(0) & (1 << 8 - excessBits) - 1).toByte
    }
    randomBits
  }
}

class ScalaRandom(random: scala.util.Random) extends Rnd {
  override def nextBytes(bytes: Array[Byte]): Unit = random.nextBytes(bytes)
  override def nextInt(n:       Int):         Int = random.nextInt(n = n)
  override def nextBoolean(): Boolean = random.nextBoolean()
}

class InputStreamRandom(input: java.io.InputStream) extends Rnd {
  override def nextInt(n: Int) = ???
  override def nextBoolean() = ???
  override def nextBytes(bytes: Array[Byte]): Unit = ???
}
