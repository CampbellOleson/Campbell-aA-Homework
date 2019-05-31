require_relative 'piece'
class King < Piece
    include Steppable
    attr_accessor :symbol
    def initialize(color, pos, symbol, board=nil)
    super
    end

    def _moves
        self.moves(pos, king_moves)
    end

end