require_relative 'board.rb'
require_relative 'tile.rb'

class MinesweeperGame
  def initialize(board)
    @board = board
  end

  def play
    until won? || gameover?
      @board.render
      play_turn
    end
    puts won? ? "Game won" : "Game over"
  end

  def play_turn
    move = @board.get_move
    row, col = @board.get_pos
    # move is reveal
    if move == 'r'

    # move is flag
    else

    end

  end

  def won?

  end

  def gameover?

  end

end
