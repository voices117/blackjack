Given(/^visito la pagina$/) do
  visit '/blackjack'
  c = Card.new Card::DIAMONDS, 7

  # add some fixed cards
  @@game.deck.put c
  @@game.deck.put c
  @@game.deck.put c
end

Then(/^veo "(.*?)"$/) do |texto| 
	last_response.body.should =~ /#{texto}/m
end

When(/^click "(.*)"$/) do |text|
	click_link(text)
end

