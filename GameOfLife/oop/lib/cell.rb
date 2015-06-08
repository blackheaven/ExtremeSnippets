require 'state'

class Cell
  attr_reader :state

  def initialize(state)
    @state = state
  end
end
