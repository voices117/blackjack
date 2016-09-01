require_relative 'deck'

class Game
	attr_reader :score
	attr_reader :player
	attr_reader :deck
	
	def initialize
		@deck = Deck.new
	end

	def add_player player
		@player = player
	end

	def deal
		@player.add_card @deck.draw_card
	end
end