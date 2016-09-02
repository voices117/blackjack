require 'sinatra'
require_relative './lib/game'
require_relative './lib/player'

get '/' do
    
end

get '/blackjack' do
	@@game = Game.new
	@@game.add_player Player.new
	@@total = 0
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
	if @@total > 17 && @@total <= 21
		@resultado = "El dealer tiene 17. GANASTE!!"
	else
		@resultado = "El dealer tiene 17. PERDISTE!!"
	end
	erb :blackjack
end
