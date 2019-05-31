require_relative 'piece'
class Pawn < Piece
    include PawnPowers
    
    def initialize(color, pos, symbol, board=nil)
    super
    end
    attr_accessor :symbol
    def enemies_present?(pos)
        x,y = pos 
        return true if board.grid[x][y].color != self.color
    end

    def enemies_present? #needs to return a boolean and coordinate because pawn can only move diagonally in the direction where there is an enemy
        case self.color 
        when "white"
            if board.grid[self.pos[0] + 1][self.pos[1] - 1].color == "black" && board.grid[self.pos[0] + 1][self.pos[1]+ 1].color == "black"
                return [[self.pos[0] + 1,self.pos[1] - 1],[self.pos[0] + 1,self.pos[1] + 1]]
            elsif board.grid[self.pos[0] + 1][self.pos[1] - 1].color == "black"
                return [[self.pos[0] + 1],[self.pos[1] - 1]]
            elsif board.grid[self.pos[0] +1][self.pos[1] + 1].color == "black"
                return [[self.pos[0] + 1][self.pos[1] + 1]]
            end
        when "black"
            if board.grid[self.pos[0] - 1][self.pos[1] - 1].color == "black" && board.grid[self.pos[0] - 1][self.pos[1] + 1].color == "black"
                return [[self.pos[0] - 1,self.pos[1] - 1],[self.pos[0] - 1,self.pos[1] + 1]]
            elsif board.grid[self.pos[0] - 1][self.pos[1] - 1].color == "black"
                return [[self.pos[0] - 1],[self.pos[1] - 1]]
            elsif board.grid[self.pos[0] - 1][self.pos[1] + 1].color == "black"
                return [[self.pos[0] - 1][self.pos[1] + 1]]
            end
        end
        false
    end

    
    def moving
        possible_moves = []
        possible_moves += enemies_present? if enemies_present?
        case self.color 
        when "white" 
            if pos[0] == 1
            goingdown.each { |ele| possible_moves << [ele[0] + self.pos[0],ele[1] + self.pos[1]] }
            else 
                move_one_space = goingdown[0]
                possible_moves << [move_one_space[0] + self.pos[0] , move_one_space[1] + self.pos[1]]
            end
        
        when "black"
            if pos[0] == 6
            goingup.each {|ele| possible_moves << [ele[0] + self.pos[0],ele[1] + self.pos[1]]}
            else 
                move_one_space = goingup[0]
                possible_moves << [move_one_space[0] + self.pos[0] , move_one_space[1] + self.pos[1]]
            end
        end
        possible_moves
    end


end

# black is rows 7
# white is row  1