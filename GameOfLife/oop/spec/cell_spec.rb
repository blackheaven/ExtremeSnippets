require 'cell'

def sim_cell(init_state, neighbours_state, expected_state)
  neighbours = neighbours_state.map do |s|
    Cell.new(s, [])
  end
  expect(Cell.new(init_state, neighbours).state).to eq(expected_state)
end

describe Cell do
  describe :state do
    it { expect(Cell.new(State::Dead, []).state).to eq(State::Dead) }
    it { expect(Cell.new(State::Alive, []).state).to eq(State::Alive) }
  end
  describe :evolve do
    describe 'Dead cell' do
      describe 'No neighbours' do
        it "should stay dead" do
            sim_cell(State::Dead, [], State::Dead)
        end
      end
      describe 'One neighbour' do
        describe 'One dead neighbour' do
          it "should stay dead" do
            sim_cell(State::Dead, [State::Dead], State::Dead)
          end
        end
        describe 'One alive neighbour' do
          it "should stay dead" do
            sim_cell(State::Dead, [State::Alive], State::Dead)
          end
        end
      end
    end
  end
end
