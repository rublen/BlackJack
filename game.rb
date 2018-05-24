require_relative 'deck'
require_relative 'player'
require_relative 'dealer'
require_relative 'interface'

class Game
  include Interface

  attr_accessor :bets
  attr_reader :deck, :player, :dealer

  def initialize(name)
    @deck = Deck.new
    @player = Player.new(name)
    @dealer = Dealer.new
    @bets = 0
  end

  def place_the_bet
    self.bets += 20
    player.bank -= 10
    dealer.bank -= 10
  end

  def over?
    (player.cards.size == 3) || (dealer.cards.size == 3)
  end

  def draw?
    (player.points == dealer.points) || (player.points > 21 && dealer.points > 21)
  end

  def winner
    return dealer if player.points > 21
    return player if dealer.points > 21
    player.points > dealer.points ? player : dealer
  end

  def share_money
    if draw?
      dealer.bank += 10
      player.bank += 10
    else
      winner.bank += 20
    end
  end

  def deal_2_cards
    2.times do
      player.deal(deck.card)
      dealer.deal(deck.card)
    end
    display(:cards)
    puts_player_points
  end

  def play_to_end
    dealer.hidden_cards = dealer.true_cards
    until over?
      case step
      when 'Hit' then player.deal(deck.card)
      when "Show cards" then break
      end
      dealer.points < 17 ? dealer.deal(deck.card) : next
    end
    puts_result_tables
  end

  def start
    deal_2_cards
    place_the_bet
    play_to_end
    puts_winner
    share_money
    puts_banks
  end

  def reset
    @deck = Deck.new
    @bets = 0
    player.cards = []
    dealer.cards = []
    dealer.hidden_cards = ['*', '*']
  end
end
