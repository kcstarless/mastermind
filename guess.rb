require_relative "colors"

class Guess
  using Colors

  attr_accessor :guess_a_color, :guess_current, :guess_history
  def initialize
    @guess_current = []
    @guess_history = []
    @guess_a_color = nil
  end

  def display_guess(hint)
    puts "---------------------------------"
    guess_history.each_with_index do |v, i|
      # print "#{guess_history.index(i) + 1}. "
      v.each do |j|
        print "|   #{j}   "
      end
      print "|"
      hint.each_with_index do |x, y|
        x.each do |z|
          if y == i
          print " #{z} "
          end
        end
      end
      puts ""
    end
    puts "---------------------------------"
  end

  def get_guess
    guess_current = Array.new
    i = 1
    loop do
      print "Place your peg Red, Green, Blue or Yellow in #{i} Position: "
      guess_a_color = gets.chomp.downcase
      case guess_a_color
      when "r"
        guess_current.append("R".fg_color(:red))
      when "g"
        guess_current.append("G".fg_color(:green))
      when "b"
        guess_current.append("B".fg_color(:blue))
      when "y"
        guess_current.append("Y".fg_color(:yellow))
      else
        puts "Error! Must be RGBY or rgby"
      end
      i += 1
      if i > 4
        break
      end
    end
    guess_history.concat([guess_current])
    return guess_current
  end

end
