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
		numaces = 0

		@hand.each { |card|
			if card.number == 1
				numaces += 1
			end
			score += card.value
		}

		while score > 21 && numaces > 0 do
			score -= 10
			numaces -= 1
		end		

		score
	end

	def remove_cards
		@hand = []
	end
end
