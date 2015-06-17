require 'evolution'

module Counter
  def self.computeNextState(state, neighbours_state)
    evolution = Counter::Zero.new
    neighbours_state.map do |n|
      evolution = n.register(evolution)
    end
    state.evolveFromNow(evolution)
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
end
