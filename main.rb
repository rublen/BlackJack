require_relative 'game'

game = Game.new

loop do
  game.start
  if game.dealer.bank.zero?
    game.puts_cograts
    break
  end
  break if game.ask_for_new_round == 'n'
  game.reset
  puts "\n\n--> NEW GAME!!"
end
