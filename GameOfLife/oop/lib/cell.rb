require 'state'
require 'counter'

class Cell
  attr_reader :state

  def initialize(state, neighbours)
    @state = state
    @neighbours = neighbours
  end

  def evolve
    Cell.new(computeNextState, [])
  end

  private
  def computeNextState
    Counter::computeNextState(@state.new, @neighbours.map(&:state))
  end
end

