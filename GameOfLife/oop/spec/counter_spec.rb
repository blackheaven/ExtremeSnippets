require 'counter'

def scenario(init_state, neighbours_state, expected_state)
  expect(Counter::computeNextState(init_state.new, neighbours_state.map(&:new))).to eq(expected_state)
end

describe Counter do
  describe :computeNextState do
    describe 'Dead cell' do
      it 'No alive neighbours should stay dead' do
          scenario(State::Dead, [], State::Dead)
      end
      it 'One alive neighbour should stay dead' do
          scenario(State::Dead, [State::Alive], State::Dead)
      end
      it 'Two alive neighbours should stay dead' do
          scenario(State::Dead, [State::Alive, State::Alive], State::Dead)
      end
      it 'Three alive neighbours should get to life' do
          scenario(State::Dead, [State::Alive, State::Alive, State::Alive], State::Alive)
      end
      it 'Four alive neighbours should stay dead' do
          scenario(State::Dead, [State::Alive, State::Alive, State::Alive, State::Alive], State::Dead)
      end
    end
    describe 'Alive cell' do
      it 'No alive neighbours should die' do
          scenario(State::Alive, [], State::Dead)
      end
      it 'One alive neighbour should die' do
          scenario(State::Alive, [State::Alive], State::Dead)
      end
      it 'Two alive neighbours should stay alive' do
          scenario(State::Alive, [State::Alive, State::Alive], State::Alive)
      end
      it 'Three alive neighbours should stay alive' do
          scenario(State::Alive, [State::Alive, State::Alive, State::Alive], State::Alive)
      end
      it 'Four alive neighbours should die' do
          scenario(State::Alive, [State::Alive, State::Alive, State::Alive, State::Alive], State::Dead)
      end
    end
  end
end
