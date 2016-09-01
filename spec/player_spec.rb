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

	it 'should have no cards when cards are removed' do
		p = Player.new
		p.add_card(Card.new Card::DIAMONDS, 2)

		p.hand.size.should == 1

		p.remove_cards
		p.hand.size.should == 0
	end

	it 'should know the correct card values for the numeric cards' do
		p = Player.new

		for i in 2..10 do
			p.remove_cards

			p.add_card(Card.new Card::DIAMONDS, i)
			p.score.should == i
		end
	end
end
