module GameModule
  NUMBER_OF_GUESSES = 12

  # Player chooses game mode.
  def game_mode()
    print info(:choose)
    mode = gets.chomp.to_i
    unless [1, 2].include?(mode)
      puts info(:choose_warning)
      return game_mode
    end
    human_creator() if mode == 1
    computer_creator() if mode == 2
  end

  # Plays rounds number of times.
  def rounds(player)
    NUMBER_OF_GUESSES.times do
      secret = player.secretColor.dup
      # Human or computer to guess the code.
      guess = player.computer_guess().dup if player.is_a?(CreatorPlayer)
      guess = player.human_guess().dup if player.is_a?(CreatorComputer)
      # Displays guesses and hints.
      display_guess(player.guessHistory, hint_history(hint(secret, guess)))
      winner?(player.guessCurrent, player.secretColor)
    end
  end

  def human_creator()
    print creator_info()
    human = CreatorPlayer.new
    secret = human.create_secret()
    rounds(human)
    display_secret(secret)
  end

  def computer_creator()
    print guesser_info()
    computer = CreatorComputer.new
    secret = computer.auto_generate_secret()
    # display_secret(secret)
    rounds(computer)
  end

  # Checks if code is cracked and displays the secret code.
  def winner?(guess, secret)
    if guess == secret
      puts info(:correct)
      display_secret(secret)
      exit
    end
  end

end
