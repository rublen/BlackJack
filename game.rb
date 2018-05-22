require_relative 'deck'

class Game
  attr_accessor :deck, :player, :dealer, :bets
  def initialize(name)
    @deck = Deck.new
    @player = Player.new(name)
    @dealer = Dealer.new
    @bets = 0
  end

  def deal(smb)
    smb.cards << deck.card
  end

  def display(card)
    print card
  end

  def place_the_bet
    @bets += 20
    player.bank -= 10
    dealer.bank -= 10
  end

  def score
    aces = cards.count(11)
    return cards.sum if aces.zero?
    cards.sort!
    sum_without_aces = cards[0...-i].sum
    case aces
    when 1
      return sum_without_aces < 11 ? sum_without_aces + 11 : sum_without_aces + 1
    when 2
      return sum_without_aces < 10 ? sum_without_aces + 12 : sum_without_aces + 2
    when 3
      return 13
    end
  end

  def over?
    (player.cards.size == 3) || (dealer.cards.size == 3)
  end

end
