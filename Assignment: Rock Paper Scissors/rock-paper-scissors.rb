def play_rock_paper_scissors
  accepted_moves = {
    :rock => "scissors",
    :paper => "rock",
    :scissors => "paper"
  }

  winners_text = {
    :rock => "Rock crushes scissors",
    :paper => "Paper covers rock",
    :scissors => "Scissors cuts paper"
  }

  player_one_wins = 0
  player_two_wins = 0

  puts "Rock Paper Scissors"

  while player_one_wins < 2 && player_two_wins < 2
    print "Player 1 - Enter your selection: "
    player_one = gets.chomp.downcase
    player_one_symbol = player_one.to_sym

    print "Player 2 - Enter your selection: "
    player_two = gets.chomp.downcase
    player_two_symbol = player_two.to_sym

    if (accepted_moves[player_one_symbol] && accepted_moves[player_two_symbol])
      
      if accepted_moves[player_one_symbol] == player_two
        
        puts winners_text[player_one_symbol]
        player_one_wins += 1

      elsif accepted_moves[player_two_symbol] == player_one

        puts winners_text[player_two_symbol]
        player_two_wins += 1

      else 
        puts "Tie!"
      end

    else
      puts "No cheaters! Only Rock, Paper or Scissors are allowed."
    end

  end

  if player_one_wins == 2
    puts "Player 1 wins"
  else
    puts "Player 2 wins"
  end
end

play_rock_paper_scissors