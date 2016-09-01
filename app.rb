require 'sinatra'

get '/' do
    
end

get '/blackjack' do
	@@total = 0
	erb :blackjack
end

get '/pedir' do
	@@total += 7
	if @@total > 21
		@resultado = "PERDISTE!!"
	end
	erb :blackjack
end

get '/plantarme' do
	if @@total > 17
		@resultado = "GANASTE!!"
	else
		@resultado = "PERDISTE!!"
	end
	erb :blackjack
end
