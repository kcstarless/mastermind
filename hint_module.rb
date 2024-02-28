module HintModule
  @@hintHistory = []
  # Return number of correct color&position pegs & correct color
  def hint(secret, guess)
    return  [
              color_position(secret, guess),
              not_in_position(secret, guess),
            ]
  end
  # Records hint into history
  def hint_history(hint)
    @@hintHistory.append(hint)
  end
  # Return number of correct position and color.
  def color_position(secret, guess)
    guess.reject!.with_index do |value, index|
      if secret.at(index) == value
        guess[index], secret[index] = nil, nil
      end
    end
    return 4 - guess.size
  end
  # Returns number of correct color but out of position.
  def not_in_position(secret, guess)
    count = 0
    secret.each do |value|
      if guess.include?(value) && value != nil
        secret[secret.index(value)] = nil
        count += 1
      end
    end
    secret.delete(nil)
    return count
  end

end
