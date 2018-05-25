class Player

  attr_accessor :cards_values, :cards, :bank
  attr_reader :name

  def initialize(name = 'DEALER')
    @name = name
    @cards_values = []
    @cards = ""
    @bank = 0
  end

  def deal(card)
    cards_values << card.value
    @cards << card.face << '  '
  end

  def desision(answer)
    case answer
    when 1 then return
    when 2 then return 'Hit'
    when 3 then return 'Show cards'
    else raise "Invalid input. Try again"
    end
  end

  def points
    hand_cards = self.cards_values
    s = hand_cards.sum
    return s if s <= 21
    aces = hand_cards.count(11)
    return s if aces.zero?
    hand_cards.sort!
    sum_without_aces = hand_cards[0...-aces].sum
    case aces
    when 1 then return sum_without_aces + 1
    when 2 then return sum_without_aces < 10 ? sum_without_aces + 12 : sum_without_aces + 2
    when 3 then return 13
    end
  end
end
