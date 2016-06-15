require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game.rb'
require_relative 'wincrement.rb'
require 'pry'


def playagain?
  puts "The game is over! Do you want to play again? (Y/N)"
  input = gets.chomp
  if input == "Y"
    play
  elsif input == "N"
    puts "How about a nice game of Global Thermonuclear War?"
  else
    playagain?
  end
end

def play 
  tictactoe = Game.new
  until tictactoe.board.winning(tictactoe.board.board_spots) == true || tictactoe.board.full?(tictactoe.board.board_spots) == true
    tictactoe.turn(tictactoe.current_move)
    tictactoe.board.display_board
    tictactoe.board.winning(tictactoe.board.board_spots)
    tictactoe.board.full?(tictactoe.board.board_spots)
  end
  Wincrement.new(tictactoe).run
  playagain?
end

play

