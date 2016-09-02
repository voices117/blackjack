require_relative '../lib/game'
require_relative '../lib/player'

describe 'Game' do
	it 'should be possible to add a player' do
		g = Game.new
		p = Player.new
		g.add_player p
	end

	it 'should be possible to add more than one player' do
		g = Game.new
		p1 = Player.new
		g.add_player p1
		p2 = Player.new
		g.add_player p2

		g.new_round

		g.players.size.should == 2
		g.players[0].should == p1
		g.players[1].should == p2
	end

	it 'should start by dealing 2 cards to each player' do
		g = Game.new
		p1 = Player.new
		g.add_player p1
		p2 = Player.new
		g.add_player p2

		g.new_round

		p1.hand.size.should == 2
		p2.hand.size.should == 2
	end

	it 'should be possible to deal a card' do
		g = Game.new
		p = Player.new
		g.add_player p

		g.new_round

		p.hand.size.should == 2
		g.deal
		p.hand.size.should == 3
		g.deal
		p.hand.size.should == 4
	end

	it 'should be possible to get the player' do
		g = Game.new
		p = Player.new
		g.add_player p
		g.players[0].should == p
	end

	it 'should be possible to get the deck' do
		g = Game.new
		g.deck
	end

	it 'should be possible to increase the turn' do
		g = Game.new
		g.new_round
		g.next_turn
		g.next_turn
	end

	it 'should tell whether the round is finished' do
		g = Game.new
		p = Player.new
		g.add_player p
		g.new_round
		g.finished?.should == false
		g.next_turn
		g.finished?.should == true
		g.new_round
		g.finished?.should == false
	end

	it 'shouldn\'t allow to deal when game is finished' do
		g = Game.new
		p = Player.new
		g.add_player p
		g.new_round
		g.next_turn
		g.finished?.should == true
		expect{ g.deal }.to raise_exception
	end

	it 'should deal to the next player when changing turns' do
		g = Game.new
		p1 = Player.new
		g.add_player p1
		p2 = Player.new
		g.add_player p2

		g.new_round

		p1.hand.size.should == 2
		p2.hand.size.should == 2

		g.deal
		g.deal

		p1.hand.size.should == 4
		p2.hand.size.should == 2

		g.next_turn
		g.deal

		p1.hand.size.should == 4
		p2.hand.size.should == 3
	end

	it 'should start by dealing 2 cards to each player after each round' do
		g = Game.new
		p1 = Player.new
		g.add_player p1
		p2 = Player.new
		g.add_player p2

		g.new_round

		p1.hand.size.should == 2
		p2.hand.size.should == 2

		g.deal
		g.deal

		p1.hand.size.should == 4
		p2.hand.size.should == 2

		g.next_turn
		g.deal

		p1.hand.size.should == 4
		p2.hand.size.should == 3

		g.new_round

		p1.hand.size.should == 2
		p2.hand.size.should == 2
	end
end
