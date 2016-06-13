class Player

	attr_accessor :mark
	attr_reader :name

	@@players = []

	def self.players
		@@players
	end

	def initialize(name)

		if Player.players.find {|player| player.name == name}
			player  
		else
			@name = name
			Player.players << self
			self
		end
	
		@mark = nil
		@record = [0, 0]
	end

	def move
		#Remember to see if square is occupied
		puts "Please enter a valid move (1 - 9): "
		move = gets.chomp.to_i - 1
		puts move.class
		[@mark, move]
	end	

end