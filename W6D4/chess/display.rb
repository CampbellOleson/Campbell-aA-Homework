require_relative 'board'
require_relative 'cursor'
require 'colorize'
require 'byebug'

class Display

    attr_reader :cursor
    attr_accessor :board
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    
    # def colorize_cursor
    #     # d_b = board.grid.each do |row|
    #     #     row.each
    #     x,y = cursor.cursor_pos
    #     board.grid[x][y].color.to_s.colorize(:background => :blue)
    # end

    def render
       system("clear")
        board.grid.each_with_index do |row,i1|
            complete_row = []
            row.each_with_index do |col,i2|
                pos = [i1, i2]
                # debugger
                if pos == cursor.cursor_pos
                    complete_row << board.grid[i1][i2].symbol.colorize(:color => :white, :background => :black)
                else
                complete_row << board.grid[i1][i2].symbol.colorize(:color => :white, :background => :red)
                end
            end
            puts complete_row.join
        end
    end

end

board = Board.new
display = Display.new(board)


loop do
    display.render
    p "------------------"
    display.cursor.get_input
end
