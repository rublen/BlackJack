require_relative 'game'

puts "Hi! I'm Jack. Black Jack. What's your name? "
name = gets.chomp.capitalize
puts "Let's start our game, #{name}! Say godbye to your money!"

game = Game.new(name)
puts " * * "
2.times do
  display game.deal(player)
  game.deal(dealer)
end
puts "#{name}'s score: "
game.place_the _bet
