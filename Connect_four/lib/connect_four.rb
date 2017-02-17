class Player
  attr_reader :name, :piece
  
  def initialize(piece)
    name = gets.chomp.upcase
    @name = name
    @piece = piece
    puts "#{name} will play with '#{@piece}'.", "\n"
  end  
end




class Board
  attr_accessor :cells, :arr1, :arr2, :arr3, :arr4, :arr5, :arr6, :arr7
  
  def initialize
    @arr1 = Array.new(6, " ")
    @arr2 = Array.new(6, " ")
    @arr3 = Array.new(6, " ")
    @arr4 = Array.new(6, " ")
    @arr5 = Array.new(6, " ")
    @arr6 = Array.new(6, " ")
    @arr7 = Array.new(6, " ")
  end
  
  def show
    @cells = @arr1 + @arr2 + @arr3 + @arr4 + @arr5 + @arr6 + @arr7
    puts "+---+---+---+---+---+---+---+"
    puts "| #{@cells[5]} | #{@cells[11]} | #{@cells[17]} | #{@cells[23]} | #{@cells[29]} | #{@cells[35]} | #{@cells[41]} |"
    puts "+---+---+---+---+---+---+---+"
    puts "| #{@cells[4]} | #{@cells[10]} | #{@cells[16]} | #{@cells[22]} | #{@cells[28]} | #{@cells[34]} | #{@cells[40]} |"
    puts "+---+---+---+---+---+---+---+"
    puts "| #{@cells[3]} | #{@cells[9]} | #{@cells[15]} | #{@cells[21]} | #{@cells[27]} | #{@cells[33]} | #{@cells[39]} |"
    puts "+---+---+---+---+---+---+---+"
    puts "| #{@cells[2]} | #{@cells[8]} | #{@cells[14]} | #{@cells[20]} | #{@cells[26]} | #{@cells[32]} | #{@cells[38]} |"
    puts "+---+---+---+---+---+---+---+"
    puts "| #{@cells[1]} | #{@cells[7]} | #{@cells[13]} | #{@cells[19]} | #{@cells[25]} | #{@cells[31]} | #{@cells[37]} |"
    puts "+---+---+---+---+---+---+---+"
    puts "| #{@cells[0]} | #{@cells[6]} | #{@cells[12]} | #{@cells[18]} | #{@cells[24]} | #{@cells[30]} | #{@cells[36]} |"
    puts "+---+---+---+---+---+---+---+"
    puts "| 1 | 2 | 3 | 4 | 5 | 6 | 7 |"
  end
end




class Game
  
  def initialize
    puts "WELCOME TO CONNECT FOUR GAME:", "\n"
    print "Enter a name por Player 1: "
    @player1 = Player.new("\u2663".encode('utf-8'))
    print "Enter a name for Player 2: "
    @player2 = Player.new("\u2665".encode('utf-8'))
    @board = Board.new
    @board.show
    @curr_player = @player1
  end
  
  def play
    print "\n#{@curr_player.name} please enter the columm where you want to play: "
    selection = gets.chomp.to_i
    if (1..7).include?(selection)
      case selection
      when 1
        unless @board.arr1.all? { |cell| cell != " " }
          @board.arr1.each_index do |i|
            if @board.arr1[i] == " "
              @board.arr1[i] = @curr_player.piece
              break
            end
          end
        else
          puts "That colunm is full. Try again."
          play
        end
      when 2
        unless @board.arr2.all? { |cell| cell != " " }
          @board.arr2.each_index do |i|
            if @board.arr2[i] == " "
              @board.arr2[i] = @curr_player.piece
              break
            end
          end
        else
          puts "That colunm is full. Try again."
          play
        end
      when 3
        unless @board.arr3.all? { |cell| cell != " " }
          @board.arr3.each_index do |i|
            if @board.arr3[i] == " "
              @board.arr3[i] = @curr_player.piece
              break
            end
          end
        else
          puts "That colunm is full. Try again."
          play
        end
      when 4
        unless @board.arr4.all? { |cell| cell != " " }
          @board.arr4.each_index do |i|
            if @board.arr4[i] == " "
              @board.arr4[i] = @curr_player.piece
              break
            end
          end
        else
          puts "That colunm is full. Try again."
          play
        end
      when 5
        unless @board.arr5.all? { |cell| cell != " " }
          @board.arr5.each_index do |i|
            if @board.arr5[i] == " "
              @board.arr5[i] = @curr_player.piece
              break
            end
          end
        else
          puts "That colunm is full. Try again."
          play
        end
      when 6
        unless @board.arr6.all? { |cell| cell != " " }
          @board.arr6.each_index do |i|
            if @board.arr6[i] == " "
              @board.arr6[i] = @curr_player.piece
              break
            end
          end
        else
          puts "That colunm is full. Try again."
          play
        end
      when 7
        unless @board.arr7.all? { |cell| cell != " " }
          @board.arr7.each_index do |i|
            if @board.arr7[i] == " "
              @board.arr7[i] = @curr_player.piece
              break
            end
          end
        else
          puts "That colunm is full. Try again."
          play
        end
      end
    else
      puts "\nThis is a not valid selection, try again please: "
      play
    end
    @board.show
    game_over
    switch_players
    play
  end
  
  def switch_players
    if @curr_player == @player1
      @curr_player = @player2
    else
      @curr_player = @player1
    end
  end
  
  def game_over
    @board.cells.each_index do |i|
      unless @board.cells[i] == " "        
        if @board.cells[i] == @board.cells[i+1] && @board.cells[i+1] == @board.cells[i+2] && @board.cells[i+2] == @board.cells[i+3] ||
           @board.cells[i] == @board.cells[i+6] && @board.cells[i+6] == @board.cells[i+12] && @board.cells[i+12] == @board.cells[i+18] ||
           @board.cells[i] == @board.cells[i+7] && @board.cells[i+7] == @board.cells[i+14] && @board.cells[i+14] == @board.cells[i+21] ||
           @board.cells[i] == @board.cells[i+5] && @board.cells[i+5] == @board.cells[i+10] && @board.cells[i+10] == @board.cells[i+15]           
           puts "\n#{@curr_player.name} won!!! CONGRATULATION!!!!!"
           exit
        elsif @board.cells.all? { |cell| cell != " " }
          puts "\nGame over! It's a draw!"
          exit
        end
      end
    end
  end
end

new_game = Game.new
new_game.play
