class Card
	attr_reader :suit
	attr_reader :number

	CLUBS = 1
	DIAMONDS = 2
	HEARTS = 3
	SPADES = 4

	def initialize suit, number
		if 1 > number or number > 13
			raise 'Invalid card number'
		end
		@suit = suit
		@number = number
	end
end