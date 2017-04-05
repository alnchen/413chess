require_relative 'cursor.rb'
require 'colorize'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render_board
    puts " "
    @board.grid.each_index do |row|
      @board.grid[row].each_index do |col|
        if @board.grid[row][col] == nil && [row,col] != @cursor.cursor_pos
          print "O"
        elsif @board.grid[row][col] == nil && [row,col] == @cursor.cursor_pos
          print "O".colorize(:color => :white, :background => :black)
        elsif @board.grid[row][col] != nil && [row,col] != @cursor.cursor_pos
          print "X"
        elsif @board.grid[row][col] != nil && [row,col] == @cursor.cursor_pos
          print "X".colorize(:color => :white, :background => :black)
        end
        print "  " unless col == @board.grid[col].length - 1
      end
      puts "\n"
    end
    puts " "
  end

  def play
    until @cursor.cursor_pos == [7,7]
      # break if !@board.in_bounds?(@cursor.cursor_pos)
      system 'clear'
      render_board
      @cursor.get_input
    end
  end

end
