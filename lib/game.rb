require_relative 'deck'
require_relative 'player'


class Game
	# player game status
	WON = "won"
	LOST = "lost"
	BUSTED = "busted"
	TIE = "tie"

	attr_reader :score
	attr_reader :players
	attr_reader :deck
	attr_reader :croupier

	def initialize( players = [] )
		@deck = Deck.new
		@players = players
		@croupier = Player.new
	end

	def new_round
		@turn = 0

		# all the players start with 2 cards
		players.each do |p|
			p.remove_cards
			p.add_card @deck.draw_card
			p.add_card @deck.draw_card
		end

		# the croupier too
		croupier.remove_cards
		croupier.add_card @deck.draw_card
		croupier.add_card @deck.draw_card
	end

	def add_player player
		@players << player
	end

	def deal
		if finished?
			raise 'Round finished, start a new one'
		end
		@players[@turn].add_card @deck.draw_card
	end

	def next_turn
		@turn += 1

		if finished?
			# handles the croupier's turn
			# draws cards a until it reaches (or passes) 17
			while @croupier.score < 17
				croupier.add_card @deck.draw_card
			end
		end
	end

	def finished?
		@turn >= players.size
	end

	def player_status player
		if player.score > 21
			return BUSTED
		elsif @croupier.score > 21
			return WON
		elsif player.score > @croupier.score
			return WON
		elsif player.score == @croupier.score
			return TIE
		else
			return LOST
		end
	end
end
