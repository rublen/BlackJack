require_relative 'methods'

class Player
  include Methods

  attr_accessor :cards, :bank
  attr_reader :name

  def initialize(name)
    @name = name
    @cards = []
    @bank = 100
  end

  def deal(card)
    cards << card
  end

  def step
    puts "1 - Stay\n2 - Hit\n3 - Show cards"
    print "Make the choice: "
    loop do
      answer = gets.to_i
      case answer
      when 1 then return
      when 2 then return cards.size == 2 ? 'Hit' : puts("You're not allowed for more cards")
      when 3 then return 'Show cards'
      else
        print "Invalid input. Try again: "
      end
    end
  end
end
