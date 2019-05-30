require 'byebug'
require 'colorize'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    p "Lets get started!"
    until @game_over
    self.take_turn
    end
    p game_over_message; reset_game if @game_over
  end

  def take_turn
    self.show_sequence
    @game_over = true if self.require_sequence != @seq
    @sequence_length += 1; p self.round_success_message if !@game_over
  end

  def show_sequence
    @seq = []
    sequence_length.times {self.add_random_color}
    @seq.each do |color|
      puts color.colorize(color.to_sym)
      sleep 0.75
      system("clear")
      sleep 0.25
    end
    "Repeat the sequence"
  end

  def require_sequence
    sequence = gets.chomp.split(" ")
    sequence
  end

  def add_random_color
   @seq << COLORS.sample
  end

  def round_success_message
    "Nice!"
  end

  def game_over_message
    "Game over bitch! Better luck next time"
  end

  def reset_game
    @sequence_length = 1; @game_over = false; @seq = []
  end
end

game = Simon.new
game.play