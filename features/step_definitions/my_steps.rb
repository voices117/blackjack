Given(/^visito la pagina$/) do
  visit '/blackjack'
end

Then(/^veo "(.*?)"$/) do |texto| 
	last_response.body.should =~ /#{texto}/m
end

