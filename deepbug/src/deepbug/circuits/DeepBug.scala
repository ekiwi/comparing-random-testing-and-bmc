package deepbug.circuits

import chisel3._
import chisel3.experimental.{annotate, ChiselAnnotation}
import firrtl.annotations.MemoryScalarInitAnnotation

/** from "Partial Order Reduction for Deep Bug Finding in Synchronous Hardware"
  *  Code Snippet 1: Buggy Toy Example
  */
class DeepBug(val regSize: Int = 6, withBug: Boolean = true) extends Module {
  require(regSize > 0)
  require(regSize <= 16, s"Large regSize=$regSize is not advisable")
  val inc_x = IO(Input(Bool()))
  val inc_y = IO(Input(Bool()))

  val x = RegInit(0.U(regSize.W))
  val y = RegInit(0.U(regSize.W))
  val dataSize = 1 << regSize
  val valid = Mem(dataSize, Bool())
  // initialize valid to zero
  annotate(new ChiselAnnotation {
    override def toFirrtl = MemoryScalarInitAnnotation(valid.toTarget, 0)
  })
  val data = RegInit(1.U(dataSize.W))
  val mem = Mem(dataSize, UInt(dataSize.W))
  val en_x = valid.read(x)

  when(inc_x && en_x) {
    x := x + 1.U
  }
  when(inc_y) {
    y := y + 1.U
    when(!reset.asBool) { // do not overwrite memory during reset
      valid.write(y, true.B)
    }
    mem.write(y, data)
    if (withBug) {
      // since '+' in chisel does not extend the result size by default, we need to
      // use '+&' to recreate the Verilog bug
      data := Mux(y +& 1.U === 0.U, 1.U, data << 1.U)
    } else {
      data := Mux(y + 1.U === 0.U, 1.U, data << 1.U)
    }
  }

  assert((mem.read(x) === (1.U << x)) || !valid.read(x), "x = %d", x)
}
