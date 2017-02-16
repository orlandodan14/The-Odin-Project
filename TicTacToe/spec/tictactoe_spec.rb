require 'TicTacToe'

describe "TicTAcToe Game" do
  let(:TicTacToe) {Game.new}
  
  before :all do
    @player1 = Player.new("Player1", "X")
    @player2 = Player.new("Player2", "O")
    @board = Board.new
  end
  
  describe ".play" do
    context "the selection of the player 1" do
      it "return the cell iqual to the piece according with selection" do
        selection = 2
        expect(@board.cells[selection - 1] = @player1.piece).to eql("X")
      end
    end    
  end
  
  describe ".switch_players" do
    it "return the other player" do
        game = Game.new
      expect(game.switch_players).to be(@player2)
    end
  end
  
end
