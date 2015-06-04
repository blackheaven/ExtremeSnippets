require 'evolution'

describe Evolution do
  it { expect(Evolution::Underpopulation.new.evolve).to be(Cell::Dead) }
  it { expect(Evolution::Survive.new.evolve).to be(Cell::Alive) }
end
