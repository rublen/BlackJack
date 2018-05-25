require_relative 'deck'
require_relative 'player'
require_relative 'dealer'
require_relative 'interface'

class Game
  include Interface
  INITIAL_BALANCE = 100
  RATE = 10

  attr_accessor :bets
  attr_reader :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new(ask_the_name)
    @dealer = Dealer.new
    @bets = 0
    set_initial_balance
  end

  def set_initial_balance
    player.bank = INITIAL_BALANCE
    dealer.bank = INITIAL_BALANCE
  end

  def place_the_bet
    self.bets += RATE * 2
    player.bank -= RATE
    dealer.bank -= RATE
  end

  def over?
    (player.cards_values.size == 3) || (dealer.cards_values.size == 3)
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
    player.cards = ''
    player.cards_values = []
    dealer.cards = ''
    dealer.cards_values = []
    dealer.hidden_cards = 'X  X'
  end
end
