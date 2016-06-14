require_relative 'board.rb'
require_relative 'player.rb'
require 'pry'

class Game

	attr_accessor :computermark, :board, :current_player, :player1


	def initialize
		#Generating a new board
		@board = Board.new
		@computermark = "O"
		@current_player = nil 
		#Welcoming the user - if they enter a name that exists, we will tell them to take another(?)
		self.welcome
		self.mark_select
	end

	def welcome
		puts "Welcome to Tic Tac Toe! Please enter player name: "
		playername = gets.chomp
		@player1 = Player.players.find {|player| player.name == playername}
		if @player1 == nil then	@player1 = Player.new(playername)
		else puts "Welcome back, #{player1.name}! Your record is #{player1.record[0]} wins, #{player1.record[1]} losses, and #{player1.record[2]} draw(s)."
		end
	end

	def mark_select
		puts "Please select X or O"
		player1.mark = gets.chomp
		if player1.mark == "X" 
			self.computermark = "O" 
			@current_player = :human
		elsif
			player1.mark == "O"
			self.computermark = "X"
			@current_player = :computer
		else
			self.mark_select
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
		possible_moves = []
		self.board.board_spots.each_with_index do |sign, idx|
			if sign == ' '  #or board.valid_move?(idx)
				possible_moves << idx
			end
		end
		move = [computermark, possible_moves.sample]
	end

	def turn(array) #current_move
		#Remember to see if square is occupied
		if board.valid_move?(array[1]) == true 
			board.place_mark(array)
			self.switch_player
		else
			self.turn(self.current_move)
		end	
	end	

	def winner
		if current_player == :computer
			:human
		else
			:computer
		end
	end
end
