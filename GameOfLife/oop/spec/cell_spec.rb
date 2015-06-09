require 'cell'

describe Cell do
  describe 'state' do
    it { expect(Cell.new(State::Dead).state).to eq(State::Dead) }
    it { expect(Cell.new(State::Alive).state).to eq(State::Alive) }
  end
end
