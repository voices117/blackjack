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
	if @@total > 17 && @@total <= 21
		@resultado = "El dealer tiene 17. GANASTE!!"
	else
		@resultado = "El dealer tiene 17. PERDISTE!!"
	end
	erb :blackjack
end
