module State
  class Dead
    def to_s
      "Dead"
    end
    def register(counter)
      counter
    end
    def evolveFromNow(destiny)
      destiny.evolveFromDeath
    end
  end
  class Alive
    def to_s
      "Alive"
    end
    def register(counter)
      counter.add_one
    end
    def evolveFromNow(destiny)
      destiny.evolveFromLife
    end
  end
end
