require_relative 'piece'
class Queen < Piece
    attr_accessor :pos, :color, :symbol, :board
    include Slideable 
    @@movements = [
        [1, 1],
        [1,-1],
        [-1, -1],
        [-1, 1],
        [1, 0],
        [-1, 0],
        [0, 1],
        [0, -1]
         ]
    attr_accessor :pos
   def initialize(color, pos, symbol, board=nil)
    super
   end

   def _moves
    self.moves(pos, queen_moves)
   end
   
end 