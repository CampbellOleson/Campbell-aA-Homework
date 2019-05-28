class Player

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def get_guess_pos
        p "Please enter the position of the card you would like to flip (e.g. '2 3')"
        guess = gets.chomp.split(' ').map! { |num| num.to_i }
    end

end