require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display

    attr_reader :cursor
    def initialize
        @cursor = Cursor.new([0,0], board)
    end

    def colorize_cursor
        cursor.cursor_pos.colorize(:blue)
    end

    def render
        cursor.board.grid
    end

end
board = Board.new
display = Display.new(board)


loop do
    display.render
    cursor.get_input
end

