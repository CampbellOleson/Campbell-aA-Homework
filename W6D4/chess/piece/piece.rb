require 'singleton'
class Piece
    attr_accessor :pos, :color, :symbol, :board
    def initialize(color, pos, symbol, board=nil)
        @color = color
        @pos = pos
        @symbol = symbol
        @board = board
    end
end

class NullPiece < Piece
    include Singleton
    def initialize
        @color = " "
        @symbol = :empty
    end
end

module Slideable
    DIAGONAL_MOVS = [
        [1, 1],
        [1,-1],
        [-1, -1],
        [-1, 1]
    ]
    HORIZONTAL_VERTICAL = [
        [1, 0],
        [-1, 0],
        [0, 1],
        [0, -1]
    ]
  def moves(current_pos, move_dirs)
    possible_moves = []
    move_dirs.each do |dirs|
        starting_pos = current_pos.dup
        until !board.valid_pos?(starting_pos)
            new_pos = [starting_pos[0] += dirs[0], starting_pos[1] += dirs[1]]
            possible_moves << new_pos if board.valid_pos?(new_pos)
        end
    end
    possible_moves
  end
 
  def bishop_moves
    DIAGONAL_MOVS
  end

  def rook_moves
    HORIZONTAL_VERTICAL
  end

  def queen_moves
    HORIZONTAL_VERTICAL.concat(DIAGONAL_MOVS)
  end

end

module Steppable
    DIAGONAL_MOVS = [[1, 1],[1,-1],[-1, -1],[-1, 1]]
    HORIZONTAL_VERTICAL = [[1, 0],[-1, 0],[0, 1],[0, -1]]
    VERTICAL_MOVES= [[0, 1],[0, -1]]  
    KNIGHT_MOVES= 
    [[1,2],[1,-2],[2,1],[2,-1],[-1,2],[-1,-2],[-2,1],[-2,-1]]
    
    def moves(current_pos, move_dirs)
        possible_moves = []
        move_dirs.each do |dir| 
            starting_pos = current_pos.dup
            new_pos = [starting_pos[0] += dir[0], starting_pos[1] += dir[1]]
            possible_moves << new_pos if board.valid_pos?(new_pos)
        end
        possible_moves 
    end

    def knight_moves
        KNIGHT_MOVES
    end

    def king_moves
        HORIZONTAL_VERTICAL.concat(DIAGONAL_MOVS)
    end


end

module PawnPowers
    
   GOINGUP=[[0,-1],[0,-2]]
   GOINGDOWN = [[1,0],[2,0]]
   GOINGUPATTACK = [[1,-1],[-1,-1]]
   GOINGDOWNATTACK = [[1,1],[-1,1]]

   def goingup
    GOINGUP
   end 
   
   def goingdown
    GOINGDOWN
   end

    def goingupattack 
        GOINGUPATTACK
    end
    
    def goingdownattack 
        GOINGDOWNATTACK
    end
end

