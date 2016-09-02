require_relative '../lib/deck'


describe "Deck" do

    it "should contain 52 cards unless a different number of decks is specified" do
        deck = Deck.new
        deck.num_cards.should == 364
    end

    it "should contain 52 cards if only one deck is specified" do
        deck = Deck.new 1
        deck.num_cards.should == 52
    end

    it "should decrease the number of cards when draws one" do
        deck = Deck.new 1
        deck.draw_card

        deck.num_cards.should == 51
    end

    it "should allow setting a card on top" do
        deck = Deck.new 1
        card = Card.new Card::SPADES, 8

        deck.put card
        deck.num_cards.should == 53

        drawn_card = deck.draw_card

        drawn_card.should == card
    end

end
