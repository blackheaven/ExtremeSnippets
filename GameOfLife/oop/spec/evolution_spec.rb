require 'evolution'

describe Evolution do
  it { expect(Evolution::Underpopulation.new.evolve).to be(Cell::Dead) }
end
