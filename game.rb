require_relative 'board.rb'
require_relative 'player.rb'
require 'pry'

class Game

	attr_accessor :computermark, :board, :current_player


	def initialize
		#Generating a new board
		@board = Board.new
		@computermark = "O"
		@current_player = :computer 
		#Welcoming the user - if they enter a name that exists, we will tell them to take another(?)
		puts "Welcome to Tic Tac Toe! Please enter player name: "
		#grabbing input 
		playername = gets.chomp
		@player1 = Player.new(playername)
		
		#pick your mark
		puts "Please select X or O"
		@player1.mark = gets.chomp
		if @player1.mark == "X" 
			self.computermark = "O" 
			@current_player = :human
		else
			self.computermark = "X" 
		end
		

	end

	def switch_player
		if @current_player == :human
			@current_player = :computer
		else
			@current_player = :human
		end
	end 

	def current_move
		if @current_player == :human
			@player1.move
		else
			computer_move
		end
	end

	def computer_move
		move = [computermark]
		self.board.board_spots.each_with_index do |sign, idx|
			if sign == " "
				move << idx
			end
		end
		move

	end

	def turn(array) #current_move
		#Remember to see if square is occupied
		if board.valid_move?(array[1]) == true 
			board.place_mark(array)
		else
			self.turn(self.current_move)
		end	

		self.switch_player
	end	
end

Pry.start