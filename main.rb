require_relative 'game'

puts "Hi! I'm Jack. Black Jack. What's your name? "
name = gets.chomp.upcase
puts "Let's start our game, #{name}! Say godbye to your money!"

game = Game.new(name)

loop do
  game.start
  if game.dealer.bank.zero?
    puts "#{game.player.name}, congratulations! Game is over. You won all my money!"
    break
  end
  puts "#{game.player.name}, nice game! Would you like to win all my money?"
  print "Enter 'y' to continue or 'n' to quit: "
  break if gets.strip.downcase == 'n'
  game.reset
  puts "\n\n--> NEW GAME!"
end
