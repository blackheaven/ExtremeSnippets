require 'state'

describe State do
  describe State::Dead do
    it { expect(State::Dead.new.to_s).to eq("Dead") }
  end
  describe State::Alive do
    it { expect(State::Alive.new.to_s).to eq("Alive") }
  end
end
