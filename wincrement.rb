class Wincrement

	attr_accessor :game

	def initialize(game)
		@game = game
	end

	def run
	  if game.board.winning(game.board.board_spots) == true
	    if game.winner == :human
	      game.player1.record[0] += 1
	    else game.winner == :computer
	      game.player1.record[1] += 1
	    end
	  else
	    game.player1.record[2] += 1
	  end
	end

end