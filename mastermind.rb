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

  guess_color = guess.get_guess.dup
  secret_color = secret.secret_color.dup

  if guess_color == secret_color
    puts "Correct! The secret code was: "
    secret.display_secret
    exit
  end

  count_pegged = new_game.pegged(secret_color, guess_color)
  count_out_position = new_game.position(secret_color, guess_color)
  count_no_match = secret_color.size

  hint = [count_pegged, count_out_position, count_no_match]
  hint_index.concat([hint])

  secret.display_secret
  guess.display_guess(hint_index)

  i += 1
end
