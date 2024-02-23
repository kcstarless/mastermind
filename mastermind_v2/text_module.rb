module TextContent
  def text_formatting(style, text)
    {
      'bold' => "\e[1m#{text}\e[0m"
    }[style]
  end

  def info(description)
    {
      choose: 'Press [1] for Creator OR [2] for Guesser: ',
      choose_warning: 'Invalid game mode!',
      creator_computer: 'You have chosen to guess!',
      guess_a_color: 'Place your peg! ',
      guess_warning: 'Invalid color. ',
      correct: "You've cracked the code! Well done.\nSecret key was: ",
      create_a_secret_color: "Pick you secret color peg! ",
      let_computer_guess: "\nSecret pegs are locked in. Now let computer guess your secret!"
    }[description]
  end

  def game_info
    <<~HEREDOC
      #{text_formatting('bold', 'WELCOME TO MASTERMIND!')}
    HEREDOC
  end

  def guesser_info
    <<~HEREDOC

    #{text_formatting('bold', 'How to play as guesser:')}
    1. Pick 4 color pegs (can be of same color) one at a time.
        - You must enter RED, BLUE, GREEN, YELLOW, MAGENTA or CYAN, case is ignored.
    2. Game will display pegs you've chosen and display on the screen.
    3. Along with pegs you will also see a hint! eg. 0 1 0. Hints are:
        - First number means number of pegs with correct color and correct position.
        - Second number means number of pegs with correct color but out of position.
        - Third number means number of pegs with incorrect color.
    4. Each round will display your guess and previous guesses with hints.
    5. If at any point you have correct four color pegs then game greets you with winning message and exit.
    6. After 12 rounds and you fail to get the correct pegs then you as guesser lose the game.
    7. After winning/losing game will prompt you if you like to replay the game.

    HEREDOC
  end

  def creator_info
    <<~HEREDOC

    #{text_formatting('bold', 'How to play as creator:')}
    1. You pick 4 secret color pegs (can be of same color) one at a time.
        - You must enter RED, BLUE, GREEN, YELLOW, MAGENTA, CYAN, case is ignored.
    2. Game will display your 4 secret color pegs.
    3. Computer will attempt to guess the secret code in each round.
    4. Each round of guess will display computer guess and previous guesses with hints.
    5. If at any point computer has correct pegs then game will end with message.
    6. After 12 rounds computer fails to get the correct pegs then game will end.
    7. After winning/losing game will prompt if you like to replay the game.

    HEREDOC
  end
end
