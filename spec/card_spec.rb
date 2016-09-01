require_relative '../lib/card'

describe 'Card' do
	it 'should return the suit and number with which it was created' do
		c = Card.new Card::CLUBS, 1
		c.suit.should == Card::CLUBS
		c.number.should == 1

		c = Card.new Card::CLUBS, 6
		c.suit.should == Card::CLUBS
		c.number.should == 6

		c = Card.new Card::SPADES, 13
		c.suit.should == Card::SPADES
		c.number.should == 13
	end

	it 'shouldn\'t allow to create cards with invalid numbers' do
		expect{ c = Card.new Card::CLUBS, 14 }.to raise_exception
		expect{ c = Card.new Card::CLUBS, 0 }.to raise_exception
	end

	it 'should return the proper symbol for each value' do
		symbols = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
		for v in 1..13
			c = Card.new Card::CLUBS, v
			c.symbol.should == symbols[v - 1]
		end
	end
end