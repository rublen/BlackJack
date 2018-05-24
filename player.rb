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

  def desision(answer)
    case answer
    when 1 then return
    when 2 then return 'Hit'
    when 3 then return 'Show cards'
    else raise "Invalid input. Try again"
    end
  end
end
