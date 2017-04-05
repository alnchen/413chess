module SlidingPiece
  def moves(dir)
  end

  def move_dirs
  end
end


class Piece

  attr_reader :position, :board

  def initialize(position, board)
    @position, @board = position, board 
  end

  def moves
    #returns array of spots the piece can move to
  end

end

class NullPiece < Piece
end
