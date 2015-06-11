require 'cell'

describe Cell do
  describe :state do
    it { expect(Cell.new(State::Dead, []).state).to eq(State::Dead) }
    it { expect(Cell.new(State::Alive, []).state).to eq(State::Alive) }
  end
  describe :evolve do
    describe 'Dead cell' do
      describe 'No neighbours' do
        it "should stay dead" do
          expect(Cell.new(State::Dead, []).state).to eq(State::Dead)
        end
      end
    end
  end
end
