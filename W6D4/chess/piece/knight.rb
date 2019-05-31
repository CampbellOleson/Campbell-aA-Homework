require_relative 'piece'
class Knight < Piece
    include Steppable
    attr_accessor :pos, :color, :symbol, :board
    
    def initialize(color, pos, symbol, board=nil)
    super
    end

    def _moves
        self.moves(pos, knight_moves)
    end

end

