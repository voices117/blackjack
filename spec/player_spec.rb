require_relative '../lib/player'

describe 'Player' do
	it 'should start with 0 score' do
		p = Player.new
		p.score.should == 0
	end

	it 'should start with an empty hand' do
		p = Player.new
		p.hand.should == []
	end

	it 'should be able to receive new cards' do
		p = Player.new
		c = Card.new Card::SPADES, 3
		p.add_card c
		p.hand.size.should == 1
		p.hand[0].should == c

		c = Card.new Card::DIAMONDS, 8
		p.add_card c
		p.hand.size.should == 2
		p.hand[1].should == c
	end

	it 'should accumulate the score properly' do
		p = Player.new
		c = Card.new Card::SPADES, 3
		p.add_card c
		p.score.should == 3

		c = Card.new Card::DIAMONDS, 8
		p.add_card c
		p.hand.size.should == 2
		p.hand[1].should == c
		p.score.should == 11
	end
end