require_relative "piece"
require 'byebug'

class Board
    attr_accessor :grid
    def initialize
        @grid = Array.new(8) {Array.new(8, NullPiece.new)}
    end

    def populate_grid 
        white = grid[0..1]
        black = grid[6..7]
        
        white.each_with_index do |row, i|
            row.each_with_index do |col, i2|
                grid[i][i2] = Piece.new("white", [i, i2])
            end
        end

        black.each_with_index do |row, i|
            row.each_with_index do |col, i2|
                grid[i+6][i2] = Piece.new("black", [i+6, i2])
            end
        end
    end

    def move_piece(start_pos,end_pos)
        a,b = start_pos
        c,d = end_pos
        raise "Out of bounds" if (a || c )> 7 || (a || c) < 0
        raise "Out of bounds" if (b || d) > 7 || (b || d)< 0
        raise "Invalid move" if !self[end_pos].is_a?(NullPiece) || self[start_pos].is_a?(NullPiece)
        self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
        self[end_pos].pos = end_pos
    end

    def []=(pos, value)
        x,y = pos
        grid[x][y] = value
    end

    def [](pos)
        x,y = pos
        grid[x][y] 
    end

    def valid_pos?(pos)
        pos.each { |coor| return false if coor < 0 || coor > 7}
        true
    end


end

p b = Board.new
p b.populate_grid
p b.move_piece([0,0],[3,0])
p b.grid[0][0]
p b.grid[3][0]
p b.grid[-1][-1]



