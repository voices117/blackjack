class Card
	attr_reader :suit
	attr_reader :number
	attr_reader :value

	CLUBS = 0
	DIAMONDS = 1
	HEARTS = 2
	SPADES = 3

	def initialize suit, number
		if 1 > number or number > 13
			raise 'Invalid card number'
		end
		@suit = suit
		@number = number
		@value = [number, 10].min	

		if @number == 1
			@value = 11
		end	
	end
end
