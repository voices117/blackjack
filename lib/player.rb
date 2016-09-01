class Player
	attr_reader :hand

	def initialize
		@score = 0
		@hand = []
	end

	def add_card card
		@hand << card
	end

	def score
		score = 0
		@hand.each { |card|
			score += card.number
		}

		score
	end

	def remove_cards
		@hand = []
	end
end
