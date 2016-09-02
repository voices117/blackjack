require 'sinatra'
require_relative './lib/game'
require_relative './lib/player'

get '/' do

end

get '/blackjack' do
	@@game = Game.new
	@@game.add_player Player.new

	@@game.new_round
	@@total = @@game.players[0].score
	erb :blackjack
end

get '/ronda' do
	@@game.new_round
	@@total = @@game.players[0].score
	erb :blackjack
end

get '/pedir' do
	@@game.deal
	@@total = @@game.players[0].score
	if @@total > 21
		@resultado = "PERDISTE!!"
	end
	erb :blackjack
end

get '/plantarme' do
	@@game.next_turn
	pstatus = @@game.player_status @@game.players[0]
	cstatus = @@game.player_status @@game.croupier

	if pstatus == Game::BUSTED
		@resultado = "Te pasaste. PERDISTE!!"
	elsif cstatus == Game::BUSTED
		@resultado = "El dealer tiene #{@@game.croupier.score}, se paso. GANASTE!!"
	elsif pstatus == Game::WON
		@resultado = "El dealer tiene #{@@game.croupier.score}. GANASTE!!"
	elsif pstatus == Game::TIE
		@resultado = "El dealer tiene #{@@game.croupier.score}. EMPATASTE!!"
	else
		@resultado = "El dealer tiene #{@@game.croupier.score}. PERDISTE!!"
	end

	erb :blackjack
end
