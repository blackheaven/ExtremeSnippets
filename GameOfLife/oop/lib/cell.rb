require 'state'

class Cell
  attr_reader :state

  def initialize(state, neighbours)
    @state = state
    @neighbours = neighbours
  end
end
