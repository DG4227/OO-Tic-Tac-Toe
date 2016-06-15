class Player

	attr_accessor :mark, :record
	attr_reader :name

	@@players = []

	def self.players
		@@players
	end

	def self.find_or_create_player(name)
		person = Player.players.find {|player| player.name == name}
		if person == nil then person = Player.new(name)
		else puts "Welcome back, #{person.name}! Your record is #{person.record[0]} wins, #{person.record[1]} losses, and #{person.record[2]} draw(s)."
		end
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