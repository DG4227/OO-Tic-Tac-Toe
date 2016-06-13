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

	# def current_combos(array)
	# 	signs = ["X", "O"]

	# 	signs.each_with_object([]) do |sign|
	# 		array.each_with_index |mark, idx|
	# 			x_array = []
	# 			if array[idx] == sign 
	# 				x_array << array[idx]
	# 			end
	# 			x_array
	# 		end
	# 	end
	# end

	def winning(array)
		x_array = []
		o_array = []

		array.each_with_index do |mark, idx|
			if mark == "X" 
				x_array << idx
			elsif mark == "O"
				o_array << idx
			end
		end

		mark_arrays = [x_array, o_array]

		mark_arrays.each do |marks|	
			WIN_COMBOS.each do |combo|
				if combo.all?{|num| marks.include?(num)}
					return true
				else
					next
				end
			end
		end
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

		self.display_board
	end

	def reset_board
		@board = " #{@board_spots[0]} | #{@board_spots[1]} | #{@board_spots[2]}
------------
 #{@board_spots[3]} | #{@board_spots[4]} | #{@board_spots[5]}
------------
 #{@board_spots[6]} | #{@board_spots[7]} | #{@board_spots[8]} "
	end

	def display_board
		puts @board
	end

	def valid_move?(square)
		if self.board_spots[square] == " "
			true
		else
			false
		end
	end


	def place_mark(array)
		self.board_spots[array[1]] = array[0]
		self.reset_board
	end

end
