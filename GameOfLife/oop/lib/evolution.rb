require 'cell'

module Evolution
  class Underpopulation
    def evolve
      Cell::Dead
    end
  end
  class Survive
    def evolve
      Cell::Alive
    end
  end
end
