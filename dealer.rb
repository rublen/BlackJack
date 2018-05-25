require_relative 'player'

class Dealer < Player
  attr_accessor :hidden_cards

  def initialize
    super
    @hidden_cards = 'X  X'
  end

  def cards
    hidden_cards
  end

  def true_cards
    @cards
  end
end
