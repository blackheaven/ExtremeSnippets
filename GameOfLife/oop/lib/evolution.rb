require 'state'

module Evolution
  class Underpopulation
    def evolve
      State::Dead
    end
  end
  class Survive
    def evolve
      State::Alive
    end
  end
  class Overcrowding
    def evolve
      State::Dead
    end
  end
  class Reproduction
    def evolve
      State::Alive
    end
  end
end
