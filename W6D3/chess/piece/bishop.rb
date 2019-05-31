require_relative 'piece'
class Bishop < Piece
    include Slideable 
    
    attr_accessor :pos, :symbol
   def initialize(color, pos, symbol, board=nil)
    super
   end

   def _moves
    self.moves(pos, bishop_moves)
   end

end 
