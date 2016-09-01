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
end