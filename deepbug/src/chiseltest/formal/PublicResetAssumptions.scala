package chiseltest.formal

import firrtl.CircuitState

object PublicResetAssumptions {
  def withResetAssumptions(state: CircuitState): CircuitState =
    AddResetAssumptionPass.execute(state)
}
