require 'evolution'

describe Evolution do
  it { expect(Evolution::Underpopulation.new.evolve).to be(State::Dead) }
  it { expect(Evolution::Survive.new.evolve).to be(State::Alive) }
  it { expect(Evolution::Overcrowding.new.evolve).to be(State::Dead) }
  it { expect(Evolution::Reproduction.new.evolve).to be(State::Alive) }
end
