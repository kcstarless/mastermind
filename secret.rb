require_relative "colors"

class Secret
  using Colors

  attr_accessor :secret_color

  def initialize
    @secret_color = generate_secret_color
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

  # def game_info
  #   puts ""
  #   puts "Lets play Mastermind!"
  #   puts ""
  #   puts "R is red".fg_color(:red) + " / " + "G is green".fg_color(:green) +
  #         " / " + "B is blue".fg_color(:blue) + " / " + "Y is yellow".fg_color(:yellow)
  #   puts ""
  #   puts "secret_color CODE is:"

  # end

  def generate_secret_color
    secret_color = []
    4.times do
      random = rand(4)
      if random == 0
        secret_color.append("R".fg_color(:red))
      elsif random == 1
        secret_color.append("B".fg_color(:blue))
      elsif random == 2
        secret_color.append("G".fg_color(:green))
      else
        secret_color.append("Y".fg_color(:yellow))
      end
    end
    secret_color
  end

end
