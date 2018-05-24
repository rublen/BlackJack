module Interface
  def step
    puts "1 - Stay\n2 - Hit\n3 - Show cards"
    print "Make the choice: "
    player.desision(gets.to_i)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def puts_player_points
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
end
