require_relative 'methods'

class Dealer
  include Methods

  attr_accessor :hidden_cards, :bank
  attr_writer :cards

  def initialize
    @cards = []
    @hidden_cards = ['*', '*']
    @bank = 100
  end

  def name
    'DEALER'
  end

  def cards
    hidden_cards
  end

  def true_cards
    @cards
  end

  def deal(card)
    @cards << card
  end
end
