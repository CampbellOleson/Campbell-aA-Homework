require_relative "./piece/piece.rb"
require_relative './piece/bishop.rb'
require_relative './piece/queen.rb'
require_relative './piece/rook.rb'
require_relative './piece/king.rb'
require_relative './piece/knight.rb'
require_relative './piece/pawns.rb'
require_relative 'pos_maps'
require 'byebug'

class Board
    attr_accessor :grid
    include PositionMaps
    def initialize
        @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
    end

    def populate_grid 
        white = grid[0..1]
        black = grid[6..7]
        
        white.each_with_index do |row, i|
            row.each_with_index do |col, i2|
                pos = [i,i2]
                cls = piece_maps.find_key(pos)
                grid[i][i2] = cls.new("white", pos, cls.to_s[0], self)
            end
        end 
        
        black.each_with_index do |row, i|
            row.each_with_index do |col, i2|
                pos = [i+6,i2]
                cls = piece_maps.find_key(pos)
                grid[i+ 6][i2] = cls.new("black", pos, cls.to_s[0], self)
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

class Hash
    def find_key(arr)
        self.each do |k, v|
           return k if v.is_a?(Array) && v.include?(arr)
        end 
        nil
    end
end
                