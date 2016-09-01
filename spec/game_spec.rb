require_relative '../lib/game'
require_relative '../lib/player'

describe 'Game' do
	it 'should be possible to add a player' do
		g = Game.new
		p = Player.new
		g.add_player p
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
		g.player.should == p
	end

	it 'should be possible to get the deck' do
		g = Game.new
		g.deck
	end
end