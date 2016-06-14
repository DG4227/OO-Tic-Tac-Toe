require 'pry'

class Board

	attr_accessor :board, :board_spots
	WIN_COMBOS = [
		[0, 1, 2],
		[3, 4, 5],
		[6, 7, 8],
		[0, 3, 6],
		[1, 4, 7],
		[2, 5, 8],
		[0, 4, 8],
		[2, 4, 6]
	]

	def winning(array)
		mark_arrays(array).each do |marks|	
			WIN_COMBOS.each do |combo|
				if combo.all?{|num| marks.include?(num)} then return true end
			end
		end
	end

	def mark_arrays(array)
		mark_arrays = [[],[]]  # <--hoot! hoot!
		array.each_with_index do |mark, idx|
			if mark == "X" then mark_arrays[0] << idx
			elsif mark == "O" then mark_arrays[1] << idx 
			end
		end
		mark_arrays
	end

	def full?(array)
		if array.none? {|square| square == " "}
			true
		end
	end


	def initialize

		#generates an array of empty strings
		@board_spots = Array.new(9, " ")

		#board display 

	  @board = " #{@board_spots[0]} | #{@board_spots[1]} | #{@board_spots[2]}
------------
 #{@board_spots[3]} | #{@board_spots[4]} | #{@board_spots[5]}
------------
 #{@board_spots[6]} | #{@board_spots[7]} | #{@board_spots[8]} "
 		board_coordinates
	end

	def board_coordinates
		puts "These are the board coordinates:"
 		board_coords = " 1 | 2 | 3
------------
 4 | 5 | 6
------------
 7 | 8 | 9 "
 		puts board_coords
 	end

	def reset_board
		@board = " #{@board_spots[0]} | #{@board_spots[1]} | #{@board_spots[2]}
------------
 #{@board_spots[3]} | #{@board_spots[4]} | #{@board_spots[5]}
------------
 #{@board_spots[6]} | #{@board_spots[7]} | #{@board_spots[8]} "
	end

	def display_board
		puts "\n" + @board + "\n"
	end

	def valid_move?(square)
		if self.board_spots[square] == " "
			true
		end
	end


	def place_mark(array)
		self.board_spots[array[1]] = array[0]
		self.reset_board
	end

end
