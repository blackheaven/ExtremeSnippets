require 'cell'

def sim_cell(init_state, neighbours_state, expected_state)
  neighbours = neighbours_state.map do |s|
    Cell.new(s.new, [])
  end
  expect(Cell.new(init_state, neighbours).evolve.state).to eq(expected_state)
end

describe Cell do
  describe :evolve do
    describe 'Dead cell' do
      it 'No alive neighbours should stay dead' do
          sim_cell(State::Dead, [], State::Dead)
      end
      it 'One alive neighbour should stay dead' do
          sim_cell(State::Dead, [State::Alive], State::Dead)
      end
      it 'Two alive neighbours should stay dead' do
          sim_cell(State::Dead, [State::Alive, State::Alive], State::Dead)
      end
      it 'Three alive neighbours should get to life' do
          sim_cell(State::Dead, [State::Alive, State::Alive, State::Alive], State::Alive)
      end
    end
    describe 'Alive cell' do
      it 'No alive neighbours should die' do
          sim_cell(State::Alive, [], State::Dead)
      end
      it 'One alive neighbour should die' do
          sim_cell(State::Alive, [State::Alive], State::Dead)
      end
      it 'Two alive neighbours should stay alive' do
          sim_cell(State::Alive, [State::Alive, State::Alive], State::Alive)
      end
      it 'Three alive neighbours should stay alive' do
          sim_cell(State::Alive, [State::Alive, State::Alive, State::Alive], State::Alive)
      end
    end
  end
end
