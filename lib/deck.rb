require_relative './card'


class Deck
    def initialize
        @cards = []

        [Card::CLUBS, Card::DIAMONDS, Card::HEARTS, Card::SPADES].each { |suit|
            for number in 1..13
                @cards << (Card.new suit, number)
            end
        }
    end

    def num_cards
        @cards.size
    end

    def draw_card
        @cards.pop
    end

    def put card
        @cards << card
    end
end
