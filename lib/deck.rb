require_relative './card'


class Deck
    def initialize num_decks = 7
        @cards = []

        num_decks.times do
            [Card::CLUBS,
             Card::DIAMONDS,
             Card::HEARTS,
             Card::SPADES].each { |suit|
                for number in 1..13
                    @cards << (Card.new suit, number)
                end
            }
        end

        @cards = @cards.shuffle
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
