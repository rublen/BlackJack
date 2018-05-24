module Methods
  def points
    hand_cards = self.cards
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
