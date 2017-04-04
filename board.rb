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

  def render_board
    puts " "
    @grid.each do |row|
      row.each_with_index do |item, idx|
        print item == nil ? "O" : "X"
        print "  " unless idx == row.length - 1
      end
      puts "\n"
    end
    puts " "
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    # raise "There is no piece there" if self[start_pos].nil?
    # raise "You can't move there" unless piece.valid_moves.include?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
    render_board
  end

end

# b = Board.new
# b.render_board
# b.move_piece([1,0], [2,0])
