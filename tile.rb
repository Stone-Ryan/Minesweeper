require_relative 'board.rb'

class Tile
  attr_accessor :pos, :flagged, :revealed, :bombed

  def initialize(board)
    @board = board
    @bombed = false
    @flagged = false
    @revealed = false
    @pos = pos
  end

  # returns array of neighbor's tiles
  def neighbors
    neighbor_pos = []
    row, col = @pos
    # every permutation of
    # [row -1 , row , row + 1   && col - 1, col, col+1] not including [row,col]

    3.times do |indx1|
      3.times do |indx2|
        neighbor_pos << [row+indx1-1, col+indx2-1]
      end
    end
    # need to remove negatives, values > 8, and its own coordinate
    neighbor_pos.delete([row, col])
    neighbor_pos.reject do |pos|
      r, c = pos
      r < 0 || c < 0 || r > 8 || c > 8
    end
  end

  def neighbor_bomb_count

    bomb_neighbors = neighbors.reject do |pos|
      @board[pos].bombed == false
    end
    bomb_neighbors.length
  end

  def change_val(attribute)
    !attribute
  end

end
