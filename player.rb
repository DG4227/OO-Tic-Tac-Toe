class Player

	attr_accessor :mark
	attr_reader :name

	def initialize(name)
		@name = name
		@mark = nil
		@record = [0, 0] 
	end

end