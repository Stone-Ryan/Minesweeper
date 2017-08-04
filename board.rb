require_relative 'tile.rb'
class Board
  def initialize()
    @grid = Array.new(9) {Array.new(9){Tile.new(self)}}
    tile_setup
  end

  def tile_setup
    bombs = Set.new
    until bombs.size == 10
      bombs << [rand(0,8), rand(0,8)]
    end
    @grid.each_with_index do |rows, row_idx|
      rows.each_with_index do |tile, col_idx|
        tile.pos = [row_idx, col_idx]
        tile.bombed = true if bombs.include?([row_idx, col_idx])
      end
    end
  end




  def [](pos)
    row, col = pos
    @grid[row, col]
  end

  def get_pos
    pos = nil
    until pos && valid_pos?(pos)
      puts "Please enter a position on the board (e.g., '3,4')"
      print "> "
      begin
        pos = parse_pos(gets.chomp)
      rescue=>error
        error.backtrace
        puts "Invalid position entered (did you use a comma?)"
        puts ""
        pos = nil
      end
    end
    pos
  end

  def get_move
    move = nil
    until move && valid_move?(move)
      puts "Would you like to flag/reveal? ('f' or 'r')"
      print "> "
      move = gets.chomp
    end
    move
  end

  def parse_pos(string)
    string.split(",").map { |char| Integer(char) }
  end

  def valid_pos?(pos)
    pos.is_a?(Array) &&
      pos.length == 2 &&
      pos.all? { |x| x.between?(0, board.size - 1) }
  end

  def valid_move?(move)
    move == 'r' || move == 'f'
  end

  def render
    
  end
  # def []=(position, value)
  #   row, col = position
  #   @grid[row][col] = value
  # end

end
