require 'state'
require 'evolution'

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
    evolution = Zero.new
    @neighbours.map do |n|
      evolution = n.state.register(evolution)
    end
    @state.new.evolveFromNow(evolution)
  end
end

class Zero
  def evolveFromDeath
    Evolution::Underpopulation.new.evolve
  end
  def evolveFromLife
    Evolution::Underpopulation.new.evolve
  end
  def add_one
    One.new
  end
end
class One
  def evolveFromDeath
    Evolution::Underpopulation.new.evolve
  end
  def evolveFromLife
    Evolution::Underpopulation.new.evolve
  end
  def add_one
    Two.new
  end
end
class Two
  def evolveFromDeath
    Evolution::Underpopulation.new.evolve
  end
  def evolveFromLife
    Evolution::Survive.new.evolve
  end
  def add_one
    Three.new
  end
end
class Three
  def evolveFromDeath
    Evolution::Survive.new.evolve
  end
  def evolveFromLife
    Evolution::Reproduction.new.evolve
  end
  def add_one
    TooMuch.new
  end
end
class TooMuch
  def evolveFromDeath
    Evolution::Overcrowding.new.evolve
  end
  def evolveFromLife
    Evolution::Overcrowding.new.evolve
  end
  def add_one
    self
  end
end
