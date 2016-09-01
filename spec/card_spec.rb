require_relative '../lib/card'

describe 'Card' do
	it "should return the suit and number with which it was created" do
		c = Card.new Card::CLUBS, 3
		c.suit.should == Card::CLUBS
		c.number.should == 3
	end
end