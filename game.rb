require_relative 'deck'
require_relative 'player'
require_relative 'dealer'

class Game
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
    puts "#{player.name}'s points: #{player.points}"
  end

  def display(smth)
    player.name.length < 12 ? n = 14 : n = player.name.length + 2
    puts "-" * (n + 15)
    puts "|" + " DEALER".center(12) + "|" + " #{player.name}".center(n) + "|"
    puts "|" + '-' * (12) + "|" + '-' * (n) + "|"
    puts "|" + "#{dealer.send(smth)}".center(12) + "|" + " #{player.send(smth)}".center(n) + "|"
    puts "-" * (n + 15)
   end

  def play_to_end
    dealer.hidden_cards = dealer.true_cards
    until over?
      case player.step
      when 'Hit' then player.deal(deck.card)
      when "Show cards" then break
      end
      dealer.points < 17 ? dealer.deal(deck.card) : next
    end
    puts "\n--> CARDS"
    display(:cards)
    puts "\n--> SCORE"
    display(:points)
  end

  def start
    deal_2_cards
    place_the_bet
    play_to_end

    if draw? # ничья
      puts "We've got the draw. Money go to their homes"
    else
      puts "#{winner.name} won! Money go to #{winner.name}'s bank!"
    end

    share_money
    puts "\n--> BANKS"
    display(:bank)
  end

  def reset
    @deck = Deck.new
    @bets = 0
    player.cards = []
    dealer.cards = []
    dealer.hidden_cards = ['*', '*']
  end
end
