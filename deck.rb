class Deck
  CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11] * 4
  FACES = {
            2 => ["2♣", "2♦", "2♥", "2♠"],
            3 => ["3♣", "3♦", "3♥", "3♠"],
            4 => ["4♣", "4♦", "4♥", "4♠"],
            5 => ["5♣", "5♦", "5♥", "5♠"],
            6 => ["6♣", "6♦", "6♥", "6♠"],
            7 => ["7♣", "7♦", "7♥", "7♠"],
            8 => ["8♣", "8♦", "8♥", "8♠"],
            9 => ["9♣", "9♦", "9♥", "9♠"],
            10 => ["10♣", "10♦", "10♥", "10♠",
                 "J♣", "J♦", "J♥", "J♠",
                 "Q♣", "Q♦", "Q♥", "Q♠",
                 "K♣", "K♦", "K♥", "K♠"],
            11 => ["A♣", "A♦", "A♥", "A♠"]
          }
  Card = Struct.new(:value, :face)

  def initialize
    @deck = CARDS.shuffle
    @faces = deep_copy(FACES).each_value { |v| v.shuffle! }
  end

   def deep_copy(origin)
    duplicate = {}
    origin.each { |k, v| duplicate[k] = v.dup }
    duplicate
  end

  def card
    popped_card = @deck.pop
    Card.new(popped_card, @faces[popped_card].pop)
  end
end
