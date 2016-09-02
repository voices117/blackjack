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

	it 'should make the croupier play after all players are done' do
		g = Game.new
		p1 = Player.new
		g.add_player p1

		# fix the deck so the croupier has a 12
		g.deck.put(Card.new Card::DIAMONDS, 5) # croupier's card (drawn after the user plays)
		g.deck.put(Card.new Card::DIAMONDS, 1) # croupier's card
		g.deck.put(Card.new Card::HEARTS, 1) # croupier's card
		g.deck.put(Card.new Card::CLUBS, 12)  # player's card
		g.deck.put(Card.new Card::SPADES, 5)  # player's card

		g.new_round

		g.croupier.score.should == 12

		g.next_turn

		# the croupier should have played
		g.croupier.score.should == 17
	end

	it '(the croupier) should stop when reaches 17' do
		g = Game.new
		p1 = Player.new
		g.add_player p1

		# fix the deck so the croupier has a 12
		g.deck.put(Card.new Card::DIAMONDS, 6) # croupier's card
		g.deck.put(Card.new Card::HEARTS, 1) # croupier's card
		g.deck.put(Card.new Card::CLUBS, 12)  # player's card
		g.deck.put(Card.new Card::SPADES, 5)  # player's card

		g.new_round

		g.croupier.score.should == 17

		g.next_turn

		# the croupier shouldn't have played
		g.croupier.score.should == 17
	end

	it '(the croupier) should always draw when his score is under 17' do
		g = Game.new
		p1 = Player.new
		g.add_player p1

		# fix the deck so the croupier has a 12
		g.deck.put(Card.new Card::DIAMONDS, 1) # croupier's card (draws)
		g.deck.put(Card.new Card::DIAMONDS, 1) # croupier's card (draws)
		g.deck.put(Card.new Card::DIAMONDS, 6) # croupier's card (draws)
		g.deck.put(Card.new Card::DIAMONDS, 3) # croupier's card (draws)
		g.deck.put(Card.new Card::DIAMONDS, 2) # croupier's card (draws)
		g.deck.put(Card.new Card::DIAMONDS, 2) # croupier's card
		g.deck.put(Card.new Card::HEARTS, 2) # croupier's card
		g.deck.put(Card.new Card::CLUBS, 12)  # player's card
		g.deck.put(Card.new Card::SPADES, 5)  # player's card

		g.new_round

		g.croupier.score.should == 4

		g.next_turn

		# the croupier should have played
		g.croupier.score.should == 17
	end

	it 'should display the user as busted if he gets over 21' do
		g = Game.new
		p1 = Player.new
		g.add_player p1

		# fix the deck so the user gets busted
		g.deck.put(Card.new Card::DIAMONDS, 10) # player's card (draws)
		g.deck.put(Card.new Card::DIAMONDS, 9) # croupier's card
		g.deck.put(Card.new Card::HEARTS, 10) # croupier's card
		g.deck.put(Card.new Card::CLUBS, 12)  # player's card
		g.deck.put(Card.new Card::SPADES, 5)  # player's card

		g.new_round

		g.deal
		g.next_turn

		p1.score.should == 25
		g.player_status(p1).should == Game::BUSTED
	end

	it 'should display the user lost if the croupier beats him' do
		g = Game.new
		p1 = Player.new
		g.add_player p1

		# fix the deck so the user gets busted
		g.deck.put(Card.new Card::DIAMONDS, 9) # croupier's card
		g.deck.put(Card.new Card::HEARTS, 10) # croupier's card
		g.deck.put(Card.new Card::CLUBS, 12)  # player's card
		g.deck.put(Card.new Card::SPADES, 5)  # player's card

		g.new_round

		g.next_turn

		g.player_status(p1).should == Game::LOST
	end

	it 'should display the user won if he beats the croupier' do
		g = Game.new
		p1 = Player.new
		g.add_player p1

		# fix the deck so the user gets busted
		g.deck.put(Card.new Card::DIAMONDS, 7) # croupier's card
		g.deck.put(Card.new Card::HEARTS, 10) # croupier's card
		g.deck.put(Card.new Card::CLUBS, 12)  # player's card
		g.deck.put(Card.new Card::SPADES, 1)  # player's card

		g.new_round

		g.next_turn

		g.player_status(p1).should == Game::WON
	end

	it 'should display the user won if the croupier got busted' do
		g = Game.new
		p1 = Player.new
		g.add_player p1

		# fix the deck so the user gets busted
		g.deck.put(Card.new Card::DIAMONDS, 10) # croupier's card (draw)
		g.deck.put(Card.new Card::DIAMONDS, 6) # croupier's card
		g.deck.put(Card.new Card::HEARTS, 10) # croupier's card
		g.deck.put(Card.new Card::CLUBS, 12)  # player's card
		g.deck.put(Card.new Card::SPADES, 1)  # player's card

		g.new_round

		g.next_turn

		g.player_status(p1).should == Game::WON
	end

	it 'should display the user tied if the croupier got the same score' do
		g = Game.new
		p1 = Player.new
		g.add_player p1

		# fix the deck so the user gets busted
		g.deck.put(Card.new Card::DIAMONDS, 9) # croupier's card
		g.deck.put(Card.new Card::HEARTS, 10) # croupier's card
		g.deck.put(Card.new Card::CLUBS, 12)  # player's card
		g.deck.put(Card.new Card::SPADES, 9)  # player's card

		g.new_round

		g.next_turn

		g.player_status(p1).should == Game::TIE
	end

end
