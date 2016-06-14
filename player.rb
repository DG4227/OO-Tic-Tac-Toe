class Player

	attr_accessor :mark, :record
	attr_reader :name

	@@players = []

	def self.players
		@@players
	end

	def initialize(name)
		@name = name
		@record = [0, 0, 0]	
		@mark = nil
		Player.players << self
	end

	def move
		#Remember to see if square is occupied
		puts "Please enter a valid move (1 - 9): "
		move = gets.chomp.to_i - 1
		[@mark, move]
	end	

	def display_record
		record = @record
	end


end