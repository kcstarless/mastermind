require_relative "secret"
require_relative "guess"

class Game

  # Out of position
  def position(secret_copy, guess_copy)
    count = 0
    secret_copy.each do |g_value|
      if guess_copy.include?(g_value) && g_value != nil
        # puts "Out of position #{g_value} count: #{count += 1}"
        secret_copy[secret_copy.index(g_value)] = nil
        count += 1
      end
    end
    secret_copy.delete(nil)
    count
  end

  # Pegged, color & position
  def pegged(secret_copy, guess_copy)
    count = 0
    guess_copy.each_with_index do |g_value, g_index|
      secret_copy.each_with_index do |s_value, s_index|
        if g_value == s_value && g_index == s_index
          # puts "Position & Color #{g_value}  count: #{count += 1}"
          count += 1
          guess_copy[s_index] = nil
          secret_copy[s_index] = nil
        end
      end
    end
    count
  end

end
