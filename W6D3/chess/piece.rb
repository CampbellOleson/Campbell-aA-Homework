require 'Singleton'
class Piece
    attr_accessor :pos
    def initialize(color, pos, board=nil)
        @color = color
        @board = board 
        @pos = pos
    end
end

class NullPiece < Piece
    def initialize
    end
# include Singleton
end