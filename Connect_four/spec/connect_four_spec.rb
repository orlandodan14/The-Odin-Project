require 'connect_four'

describe "Board" do
  let(:board) { Board.new }
  
  it "return an array with all cells" do
    expect(board.cells).to eql(Array(1..42))
  end
end

describe "Player" do
  let(:player) {Player.new}
  
  context "attributes" do
    before(:each) do
      allow(player).to receive(:name)
      allow(player).to receive(:piece)
    end
    it "return the name of Player" do
      expect(player.name).to eql("Orlando")
    end
    
    it "return the piece of player" do
      expect(player.piece).to eql("X")
    end
  end
end

describe "Game" do
  let(:game) {Game.new}
  
  
end
