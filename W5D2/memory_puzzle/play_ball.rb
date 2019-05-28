require_relative 'board'

puts 'Find all the pairs!'

puts 'Enter a size 2 4 6 8'
def get_size
    size = nil
    size = gets.chomp.to_i
    until size.between?(1,9) && size.even?
        get_size
    end
    size
end

size = get_size

puts "Enter your name"
name = gets.chomp.to_s

board = Board.new(size,name)
board.populate 
board.reveal

puts "You win!"                                                                                                                                        