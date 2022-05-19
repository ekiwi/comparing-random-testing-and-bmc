package deepbug.harness

import chiseltest.simulator.SimulatorContext

trait TestHarness {
  def start(rnd: Rnd, sim: SimulatorContext): Unit
  // returns true when done
  def step(sim: SimulatorContext): Boolean
}

class HarnessException(msg: String) extends Exception(msg)
