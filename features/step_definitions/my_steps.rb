def translate_suit palo
	suit = nil
	if palo == "trebol"
		suit = Card::CLUBS
	elsif palo == "corazon"
		suit = Card::HEARTS
	elsif palo == "pica"
		suit = Card::SPADES
	elsif palo == "diamante"
		suit = Card::DIAMONDS
	else
		raise "El palo no es valido: #{palo}" 
	end

	suit
end

def translate_num num_str
	if num_str == "A"
		return 1
	elsif num_str == "J"
		return 11
	elsif num_str == 'Q'
		return 12
	elsif num_str == 'K'
		return 13
	else	
		return num_str.to_i
	end
end
	

Given(/^visito la pagina$/) do
  visit '/blackjack'
end

Then(/^veo "(.*?)"$/) do |texto| 
	last_response.body.should =~ /#{texto}/m
end

When(/^click "(.*)"$/) do |text|
	click_link(text)
end

Given(/^el croupier tiene un "(.*?)" de "(.*?)"$/) do |numero, palo|
	suit = translate_suit palo	

	num = translate_num numero 
	c = Card.new suit, num
	@@game.deck.put c
end


Then(/^no veo "(.*?)"$/) do |texto|
	last_response.body.should_not =~ /#{texto}/m
end

Given(/^el mazo tiene "\[(.*?)\]"$/) do |v|
	v = v.split(",").map { |s| s.to_i }
	v.each do |n|
		c = Card.new Card::DIAMONDS, n
		@@game.deck.put c
	end
	@@game.new_round
end


Then(/^veo una carta boca abajo$/) do
  
end

Then(/^veo una carta "(.*?)" de "(.*?)"$/) do |numero, palo|
#	suit = translate_suit palo
#	last_response.body.should =~ /"<div class=\"numero\"> #{numero} </div>"}/m

end

