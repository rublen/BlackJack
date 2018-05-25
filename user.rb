class User < Player
  def desision(answer)
    case answer
    when 1 then return
    when 2 then return 'Hit'
    when 3 then return 'Show cards'
    else raise "Invalid input. Try again"
    end
  end
end
