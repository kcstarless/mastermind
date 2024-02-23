module GameModule
  NUMBER_OF_GUESSES = 12

  def game_mode()
    print info(:choose)
    mode = gets.chomp.to_i
    unless [1, 2].include?(mode)
      puts info(:choose_warning)
      return game_mode
    end
    player_creator() if mode == 1
    computer_creator() if mode == 2
  end

  def player_creator()
    # print creator_info()
    player = CreatorPlayer.new
    secret = player.create_secret()
    display_secret(secret)
    guess = player.guess_computer_secret()
  end

  def computer_creator()
    # print guesser_info()
    computer = CreatorComputer.new
    computer.auto_generate_secret()
    # display_secret(secret)

    NUMBER_OF_GUESSES.times do
      secret = computer.secretColor.dup
      guess = computer.guess_secret().dup
      display_guess(computer.guessHistory, hint_history(hint(secret, guess)))

      winner?(computer.guessCurrent, computer.secretColor)
    end

  end

  def winner?(guess, secret)
    if guess == secret
      puts info(:correct)
      display_secret(secret)
      exit
    end
  end


end
