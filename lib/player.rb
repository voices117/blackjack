class Player
	attr_reader :score
	attr_reader :hand

	def initialize
		@score = 0
		@hand = []
	end

	def add_card card
		@hand << card
		@score += card.number
	end
end