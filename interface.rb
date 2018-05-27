module Interface
  def ask_the_name
    puts "Hi! What's your name? "
    name = gets.chomp.upcase
    puts "Let's start our game, #{name}! Say godbye to your money!"
    name
  end

  def step
    puts "1 - Stay\n2 - Hit\n3 - Show cards"
    print "Make the choice: "
    player.desision(gets.to_i)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def puts_player_points
    puts "#{player.name}'s points: #{player.points}\n"
  end

  def display(smth)
    player.name.length < 13 ? n = 15 : n = player.name.length + 2
    puts "-" * (n + 16)
    puts "|" + " DEALER".center(13) + "|" + " #{player.name}".center(n) + "|"
    puts "|" + '-' * (13) + "|" + '-' * (n) + "|"
    puts "|" + "#{dealer.send(smth)}".center(13) + "|" + " #{player.send(smth)}".center(n) + "|"
    puts "-" * (n + 16)
  end

  def puts_result_tables
    puts "\n--> CARDS"
    display(:cards)
    puts "\n--> SCORE"
    display(:points)
  end

  def puts_winner
    if draw? # ничья
      puts "We've got the draw. Money go to their homes"
    else
      puts "#{winner.name} won! Money go to #{winner.name}'s bank!"
    end
  end

  def puts_banks
    puts "\n--> BANKS"
    display(:bank)
  end

  def puts_cograts
    puts "#{game.player.name}, congratulations! Game is over. You won all my money!"
  end

  def ask_for_new_round
    puts "#{player.name}, nice game! Would you like to win all my money?"
    print "Enter 'y' to continue or 'n' to quit: "
    gets.strip.downcase
  end
end
