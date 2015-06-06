require 'cell'

describe Cell do
  describe Cell::Dead do
    it { expect(Cell::Dead.new.to_s).to eq("Dead") }
  end
  describe Cell::Alive do
    it { expect(Cell::Alive.new.to_s).to eq("Alive") }
  end
end
