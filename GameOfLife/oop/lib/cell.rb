require 'state'

class Cell
  attr_reader :state

  def initialize(state, neighbours)
    @state = state
    @neighbours = neighbours
  end

  def evolve
    Cell.new(State::Dead, [])
  end
end
