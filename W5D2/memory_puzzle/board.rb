
require_relative 'card'
require_relative 'player'


class Board

    DECK = ('A'..'F').to_a

    def initialize(size, name)
        @player = Player.new(name)
        @size = size
        @grid = Array.new(size) { Array.new(size) }
    end
    
    def populate
        Board::DECK[0...@size].each { |face_value| (@size / 2).times { 2.times { self.assign_card(face_value) } } }
    end

    def assign_card(face_value)
        rand_row, rand_col = rand(@size), rand(@size)
        !@grid[rand_row][rand_col].is_a?(Card) ? @grid[rand_row][rand_col] = Card.new(face_value) : self.assign_card(face_value)
    end

    def render
        (0...@size).each do |row|
            complete_row = []
            (0...@size).each do |col|
                complete_row << (@grid[row][col]).display
            end
            p complete_row.join(" ")
        end
    end

    def won?
        (0...@size).each { |row| (0...@size).each { |col| return false if !@grid[row][col].flipped } }
        true
    end

    def reveal
        first_card = nil
        (0..1).each do |idx|
            guess = @player.get_guess_pos 
            redo if guess.any? { |num| num > @size || num < 0 || !num.is_a?(Integer) }
            row, col = guess
            redo if @grid[row][col].flipped
            @grid[row][col].flip
            if idx == 0
                first_card = @grid[row][col]
                self.render
            else
                self.render
                if @grid[row][col].face_value != first_card.face_value
                    @grid[row][col].flip
                    first_card.flip
                end
            end
        end
        self.reveal if !self.won?
    end

end