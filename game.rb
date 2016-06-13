require_relative 'board.rb'
require_relative 'player.rb'
require 'pry'

class Game


	@@players[]

	def self.players
		@@players
	end

	def initialize
		board = Board.new
		puts "Welcome to Tic Tac Toe! Please enter player name: "
		player1 = gets.chomp 
		self.players.include?(player1) ? 
		@@Player.new(player1)
	end


end