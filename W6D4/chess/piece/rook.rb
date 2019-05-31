require_relative 'piece'
class Rook < Piece
    include Slideable 
    attr_accessor :pos, :color, :symbol, :board
    
   def initialize(color, pos, symbol, board=nil)
    super
   end

   def _moves
    self.moves(pos, rook_moves)
   end
end 