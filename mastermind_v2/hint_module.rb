module HintModule
  @@hintHistory = []

  def hint(secret, guess)
    return  [
              color_position(secret, guess),
              not_in_position(secret, guess),
            ]
  end

  def hint_history(hint)
    @@hintHistory.append(hint)
  end

  def color_position(secret, guess)
    count = 0
    guess.each_with_index do |g_value, g_index|
      secret.each_with_index do |s_value, s_index|
        if g_value == s_value && g_index == s_index
          count += 1
          guess[s_index] = nil
          secret[s_index] = nil
        end
      end
    end
    return count
  end

  def not_in_position(secret, guess)
    count = 0
    secret.each do |g_value|
      if guess.include?(g_value) && g_value != nil
        secret[secret.index(g_value)] = nil
        count += 1
      end
    end
    secret.delete(nil)
    return count
  end

end
