class Player
  attr_reader :name, :piece
  
  def initialize(name, piece)
    @name = name
    @piece = piece
  end  
end




class Board
  attr_accessor :cells
  
  def initialize
    @cells = *(1..9)
  end
  
  def show
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "---+---+---"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "---+---+---"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
end




class Game
  
  def initialize
    puts "WELCOME TO TICTACT GAME:", "\n"
    print "Enter a name por Player 1: "
    name1 = gets.chomp.upcase
    @player1 = Player.new(name1, "X")
    puts "#{name1} will play with 'X'.", "\n"
    print "Enter a name for Player 2: "
    name2 = gets.chomp.upcase
    @player2 = Player.new(name2, "O")
    puts "#{name2} will play with 'O'.", "\n", "Let's stared...", "\n"
    @board = Board.new
    @board.show
    @curr_player = @player1
  end
  
  def play
    print "\n#{@curr_player.name} please enter a number between 1-9 to select your position: "
    selection = gets.chomp.to_i
    puts "\n "
    if selection == @board.cells[selection - 1]
      @board.cells[selection-1] = @curr_player.piece
      @board.show
      game_over
      switch_players
      play
    else
      puts "\nThis is a not valid selection, try again please: "
      play
    end
  end
  
  def switch_players
    if @curr_player == @player1
      @curr_player = @player2
    else
      @curr_player = @player1
    end
  end
  
  def game_over
    if @board.cells[0] == @board.cells[1] && @board.cells[1] == @board.cells[2] ||
       @board.cells[3] == @board.cells[4] && @board.cells[4] == @board.cells[5] ||
       @board.cells[6] == @board.cells[7] && @board.cells[7] == @board.cells[8] ||
       @board.cells[0] == @board.cells[3] && @board.cells[3] == @board.cells[6] ||
       @board.cells[1] == @board.cells[4] && @board.cells[4] == @board.cells[7] ||
       @board.cells[2] == @board.cells[5] && @board.cells[5] == @board.cells[8] ||
       @board.cells[0] == @board.cells[4] && @board.cells[4] == @board.cells[8] ||
       @board.cells[2] == @board.cells[4] && @board.cells[4] == @board.cells[6]
       puts "\n#{@curr_player.name} won!!! CONGRATULATION!!!!!"
       exit
    elsif @board.cells.all? { |cell| cell.is_a? String }
      puts "\nGame over! It's a draw!"
      exit
    end
  end
end

#new_game = Game.new
#new_game.play