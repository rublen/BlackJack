class Deck
  CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 11] * 4

  def initialize
    @deck = CARDS.shuffle
  end

  def card
    @deck.pop
  end
end
