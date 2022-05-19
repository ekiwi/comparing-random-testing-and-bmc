package deepbug.circuits

import chisel3._
import chisel3.util._

class ArbitratedIO(numFifos: Int, width: Int) extends Bundle {
  private val tagWidth = log2Ceil(numFifos)
  val push = Input(Vec(numFifos, Bool()))
  val data_in = Input(Vec(numFifos, UInt(width.W)))
  val req = Input(Bool())
  val gnt_sel = Input(UInt(tagWidth.W))
  val data_out = Output(UInt(width.W))
  val gnt = Output(Vec(numFifos, Bool()))
}

class ArbitratedTop(numFifos: Int, width: Int, val depth: Int, fixed: Boolean = false) extends Module {
  val tagWidth = log2Ceil(numFifos)

  val io = IO(new ArbitratedIO(numFifos, width))

  val empty = IO(Output(Vec(numFifos, Bool())))
  val full = Wire(Vec(numFifos, Bool()))
  val fifo_data_out = Wire(Vec(numFifos, UInt(width.W)))
  val has_credit = IO(Output(Vec(numFifos, Bool())))
  // needed for random testing
  val creditIsMax = IO(Output(Vec(numFifos, Bool())))

  (0 until numFifos).foreach { ii =>
    // non buggy fifo
    val fifo = Module(new CircularPointerFifo(width, depth, fixed = true))
    fifo.io.push := io.push(ii)
    fifo.io.pop := io.gnt(ii)
    fifo.io.data_in := io.data_in(ii)
    empty(ii) := fifo.io.empty
    full(ii) := fifo.io.full
    fifo_data_out(ii) := fifo.io.data_out

    val cc = Module(new CreditCounter(depth, fixed = fixed))
    cc.inc := io.gnt(ii)
    cc.dec := io.push(ii)
    has_credit(ii) := cc.has_credits
    creditIsMax(ii) := cc.creditIsMax

    // For now assuming every non-empty fifo is requesting
    io.gnt(ii) := io.req && (io.gnt_sel === ii.U)
  }

  // one hot mux
  io.data_out := Mux1H(io.gnt, fifo_data_out)

  // enqueue assumptions
  (0 until numFifos).foreach { ii =>
    // !has_credit |-> !push
    assume(has_credit(ii) || !io.push(ii))
    // empty |-> !pop
    assume(!empty(ii) || !io.gnt(ii))
  }
}

/** This module is a simple counter for credits
  * It does not prevent over/underflow, instead it relies on the upstream environment
  * to behave appropriately.
  * source: https://github.com/makaimann/tacas2020-exps/blob/master/credit_counter.v
  */
class CreditCounter(creditsMax: Int = 8, fixed: Boolean = false) extends Module {
  val countWidth = log2Ceil(creditsMax + 1)
  val inc = IO(Input(Bool()))
  val dec = IO(Input(Bool()))
  val has_credits = IO(Output(Bool()))

  val initValue = if (fixed) { creditsMax }
  else { creditsMax + 1 }
  val credits = RegInit(initValue.U(countWidth.W))
  credits := credits + inc - dec
  has_credits := credits > 0.U

  // assume the environment doesn't increment when credits are full
  assume(credits =/= creditsMax.U || !inc)
  // what about when credits === (creditsMax + 1) ???
  // ==> turns out that is the bug ....

  // expose credit is max to guide random testing
  val creditIsMax = IO(Output(Bool()))
  creditIsMax := credits === creditsMax.U
}
