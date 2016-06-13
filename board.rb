require 'pry'

class Board

	attr_accessor :board, :board_spots

	def initialize

		#generates an array of empty strings
		@board_spots = Array.new(9, " ")

		#board display 

	    @board = " #{board_spots[0]} | #{board_spots[1]} | #{board_spots[2]}
------------
 #{board_spots[3]} | #{board_spots[4]} | #{board_spots[5]}
------------
 #{board_spots[6]} | #{board_spots[7]} | #{board_spots[8]} "

		self.display_board
	end

	def display_board
		puts @board
	end

end