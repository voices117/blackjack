Given(/^visito la pagina$/) do
  visit '/blackjack'
end

Then(/^veo "(.*?)"$/) do |texto| 
	last_response.body.should =~ /#{texto}/m
end

When(/^click "(.*)"$/) do |text|
	click_link(text)
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