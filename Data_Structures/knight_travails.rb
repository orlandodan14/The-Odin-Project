class Knight
  attr_accessor :position, :path
  def initialize(position, path)
    @position = position
    @path = path
  end
end


def move(position)
  posibles = [[-2,-1],[-2,1],[-1,-2],[-1,2],[2,-1],[2,1],[1,-2],[1,2]]
  moves = []
  posibles.each { |move| moves << [position[0] + move[0], position[1] + move[1]] }
  moves = moves.select { |move| move[0].between?(1,8) && move[1].between?(1,8) }
end

def knight_travails(start_position, finish_position)
  queue = [Knight.new(start_position, [start_position])]
  path = [start_position]
  until queue.empty?
    curr_knight = queue.shift
    posible_moves = move(curr_knight.position).select { |move| !path.include?(move) }
    if posible_moves.include?(finish_position)
      curr_knight.path << finish_position
      puts "\nYou made it in #{curr_knight.path.size - 1} move(s)! Here's your path:"
      curr_knight.path.each { |move| p move }
      board = Board.new.show(curr_knight.path)
    end
    posible_moves.each do |move|
      new_path = curr_knight.path + [move]
      queue << Knight.new(move, new_path)
      path << move  
    end
  end
end

class Board
  def initialize
    @cells = Array.new(64, " ")
    @positions = [
      [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7], [1,8],
      [2,1], [2,2], [2,3], [2,4], [2,5], [2,6], [2,7], [2,8],
      [3,1], [3,2], [3,3], [3,4], [3,5], [3,6], [3,7], [3,8],
      [4,1], [4,2], [4,3], [4,4], [4,5], [4,6], [4,7], [4,8],
      [5,1], [5,2], [5,3], [5,4], [5,5], [5,6], [5,7], [5,8],
      [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7], [6,8],
      [7,1], [7,2], [7,3], [7,4], [7,5], [7,6], [7,7], [7,8],
      [8,1], [8,2], [8,3], [8,4], [8,5], [8,6], [8,7], [8,8]
    ]
  end
  
  def show(path)
    i = 0
    path = path
    @positions.each do |position|
      i += 1
      j = 0
      path.each do |move|
        j += 1
        if position == move
          @cells[i-1] = "#{j-1}"
        end
      end
    end
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 8 | #{@cells[56]} | #{@cells[57]} | #{@cells[58]} | #{@cells[59]} | #{@cells[60]} | #{@cells[61]} | #{@cells[62]} | #{@cells[63]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 7 | #{@cells[48]} | #{@cells[49]} | #{@cells[50]} | #{@cells[51]} | #{@cells[52]} | #{@cells[53]} | #{@cells[54]} | #{@cells[55]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 6 | #{@cells[40]} | #{@cells[41]} | #{@cells[42]} | #{@cells[43]} | #{@cells[44]} | #{@cells[45]} | #{@cells[46]} | #{@cells[47]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 5 | #{@cells[32]} | #{@cells[33]} | #{@cells[34]} | #{@cells[35]} | #{@cells[36]} | #{@cells[37]} | #{@cells[38]} | #{@cells[39]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 4 | #{@cells[24]} | #{@cells[25]} | #{@cells[26]} | #{@cells[27]} | #{@cells[28]} | #{@cells[29]} | #{@cells[30]} | #{@cells[31]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 3 | #{@cells[16]} | #{@cells[17]} | #{@cells[18]} | #{@cells[19]} | #{@cells[20]} | #{@cells[21]} | #{@cells[22]} | #{@cells[23]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 2 | #{@cells[8]} | #{@cells[9]} | #{@cells[10]} | #{@cells[11]} | #{@cells[12]} | #{@cells[13]} | #{@cells[14]} | #{@cells[15]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts " 1 | #{@cells[0]} | #{@cells[1]} | #{@cells[2]} | #{@cells[3]} | #{@cells[4]} | #{@cells[5]} | #{@cells[6]} | #{@cells[7]} |"
    puts " --+---+---+---+---+---+---+---+---+"
    puts "   | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |"
  end
end


knight_travails([1, 1], [2, 3])
knight_travails([2, 3], [5, 5])
knight_travails([5, 5], [5, 4])
knight_travails([8, 1], [8, 8])
