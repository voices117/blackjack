require_relative './card'


class Deck
    def initialize num_decks = 7
        @num_decks = num_decks
        restart
    end

    def restart
        @cards = []

        @num_decks.times do
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
        c = @cards.pop
        if @cards.size < (@num_decks * 52) * 0.1
            restart
        end
        c
    end

    def put card
        @cards << card
    end
end
