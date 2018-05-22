class Player
  attr_accessor :cards, :bank
  attr_reader :name

  def initialize(name)
    @name = name
    @cards = []
    @bank = 100
  end

  def play
    puts "The score is #{score}. Hit or Stay? Enter 'h' or 's' respectively: "
    answer = gets.chomp
  end
end
