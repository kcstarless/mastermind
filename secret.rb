require_relative "colors"

class Secret
  using Colors

  attr_accessor :secret_color, :color_pool

  def initialize
    @color_pool = ["RED", "GREEN", "BLUE", "YELLOW"]
    @secret_color = []
  end

  def display_secret
    puts "---------------------------------"
    secret_color.each do |i|
      print "|   #{i}   "
    end
    print "|"
    puts ""
    puts "---------------------------------"
  end

  def generate_secret_color(role)
    if role == "creator"
      temp_color = color_pool.sample
      secret_color.append(temp_color.fg_color(temp_color.downcase.to_sym))
      exit
    elsif role == "guesser"
      4.times do
        temp_color = color_pool.sample
        secret_color.append(temp_color.slice(0).fg_color(temp_color.downcase.to_sym))
      end
      secret_color
    else
      return "Error color not found!"
    end
  end

end
