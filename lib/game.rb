require_relative 'deck'

class Game
	attr_reader :score
	attr_reader :players
	attr_reader :deck
	
	def initialize
		@deck = Deck.new
		@players = []
		@turn = 0
	end

	def add_player player
		@players << player
	end

	def deal
		if finished?
			raise 'Round finished, start a new one'
		end
		@players[@turn].add_card @deck.draw_card
	end

	def next_turn
		@turn += 1
	end

	def finished?
		@turn >= players.size
	end
end