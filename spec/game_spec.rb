require_relative '../lib/game'

describe 'Game' do
	it 'should start with a score of 0' do
		g = Game.new
		g.score
	end
end