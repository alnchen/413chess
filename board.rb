require_relative "piece"

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8)}
    [0,1,6,7].each do |row|
      (0..7).each do |col|
        @grid[row][col] = Piece.new
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end



  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise "There is no piece there" if self[start_pos].nil?
    # raise "You can't move there" unless piece.valid_moves.include?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
    render_board
  end

  def in_bounds?(pos)
    return false if pos.any? { |el| el < 0 || el > 7}
    true
  end

end

# b = Board.new
# b.render_board
# b.move_piece([1,0], [2,0])
