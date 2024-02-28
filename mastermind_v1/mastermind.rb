# 18/02/2024 mastermind.rb
# require_relative "colors"

require_relative "secret"
require_relative "guess"
require_relative "game"

secret = Secret.new
guess = Guess.new
new_game = Game.new

NUMBER_OF_GUESSES = 12
hint_index = []
role = nil

# Creator or Guesser?
loop do

  print "Do you want to be the creator or guesser of secret code? "
  role = gets.chomp.downcase

  if (role == "creator" || role == "guesser")
    secret.generate_secret_color(role)
    break
  end
end

i = 0

while (i <= NUMBER_OF_GUESSES)
  if (role == "guesser")
    guess_color = guess.get_guess.dup
    secret_color = secret.secret_color.dup

    # puts guess_color

    count_pegged = new_game.pegged(secret_color, guess_color)
    count_out_position = new_game.position(secret_color, guess_color)
    count_no_match = secret_color.size

    hint = [count_pegged, count_out_position, count_no_match]
    hint_index.concat([hint])

    secret.display_secret
    guess.display_guess(hint_index)

    # puts guess_color

    if guess.guess_current == secret.secret_color
      # guess.display_guess(hint_index)
      puts "Correct! The secret code was: "
      secret.display_secret
      exit
    end
    i += 1
  elsif (role == "creator")

  end
end
