class Card
	attr_reader :suit
	attr_reader :number
	attr_reader :value

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
		@value = [number, 10].min	

		if @number == 1
			@value = 11
		end	
	end
end
