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

		g.players.size.should == 2
		g.players[0].should == p1
		g.players[1].should == p2
	end

	it 'should be possible to deal a card' do
		g = Game.new
		p = Player.new
		g.add_player p
		p.hand.size.should == 0
		g.deal
		p.hand.size.should == 1
		g.deal
		p.hand.size.should == 2
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
		g.next_turn
		g.next_turn
	end

	it 'should tell whether the round is finished' do
		g = Game.new
		p = Player.new
		g.add_player p
		g.finished?.should == false
		g.next_turn
		g.finished?.should == true
	end

	it 'shouldn\'t allow to deal when game is finished' do
		g = Game.new
		p = Player.new
		g.add_player p
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

		p1.hand.size.should == 0
		p2.hand.size.should == 0

		g.deal
		g.deal

		p1.hand.size.should == 2
		p2.hand.size.should == 0

		g.next_turn
		g.deal

		p1.hand.size.should == 2
		p2.hand.size.should == 1
	end
end
