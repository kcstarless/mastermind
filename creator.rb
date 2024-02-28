require_relative "text_module"
require_relative "display_module"
require_relative "hint_module"

class Creator

  include TextContent
  include HintModule
  include DisplayModule

  NUMBER_OF_PEGS = 4

  attr_accessor :secretColor, :swapPosition, :colorPool, :guessCurrent, :guessHistory, :colorMatch

  def initialize
    @colorPool = {
                    "RED" => "R".red, "GREEN" => "G".green, "BLUE" => "B".blue,
                    "YELLOW" => "Y".yellow, "CYAN" => "C".cyan, "MAGENTA" => "M".magenta
                 }
    @colorMatch = []
    @secretColor = []
    @guessCurrent = []
    @guessHistory = []
    @swapPosition = 0
  end
  # Picks random color from the color pool
  def random_color(pool, match)
    color = pool.values.sample
    if match.include?(color)
      random_color(pool, match)
    end
    pool.delete(pool.key(color)) # Removes the color form the pool/Same color is not picked.
    return color
  end

  # Swaps position.
  def swap(colors, position)
    case position
    when 0
      colors[2], colors[3] = colors[3], colors[2] # swap right.
    when 1
      colors[1], colors[2] = colors[2], colors[1] # swap middle.
    when 2
      colors[0], colors[1] = colors[1], colors[0] # swap left.
    when 3
      colors[0], colors[3] = colors[3], colors[0] # swap outer edge.
    when 4
      colors[0], colors[2] = colors[2], colors[0] # swap even index.
    when 5
      colors[1], colors[3] = colors[3], colors[1] # swap odd index.
    when 6
      colors[1], colors[2] = colors[2], colors[1] # swap middle again.
    when 7
      colors[0], colors[3] = colors[3], colors[0] # swap edge again.
    else
      colors.shuffle
    end
    return colors
  end
  # Returns true if previous guess color & position numbers is greater than current guess.
  def switch_back?(current, previous)
    return (color_position(secretColor.dup, current.dup) < color_position(secretColor.dup, previous.dup))
  end
  # Computer guess secret.
  def computer_guess()
    guessCurrent = Array.new
    sleep(2)
    if colorMatch.size == NUMBER_OF_PEGS # If all 4 colors are found.
      previousMatch = colorMatch.dup  # Duplicates previous color match.
      guessCurrent.replace(colorMatch) # Populates current guess.
      guessCurrent = swap(guessCurrent, swapPosition) # swaps the guess based on swap position.
      switch_back?(guessCurrent, colorMatch) ? colorMatch.replace(previousMatch) : colorMatch.replace(guessCurrent)
      self.swapPosition += 1
    else # Finds 4 matching colors.
      color = random_color(colorPool, colorMatch)
      (NUMBER_OF_PEGS - colorMatch.size).times {guessCurrent.push(color)}
      guessCurrent = colorMatch.dup.concat(guessCurrent)
      currentSum = hint(secretColor.dup, guessCurrent.dup).sum
      (currentSum - colorMatch.size).times {colorMatch.push(color)} if currentSum > colorMatch.size
    end
    guess_history(guessCurrent)
    return guessCurrent
  end
  # Prompt player to guess the code
  def human_guess()
    guessCurrent = Array.new
    NUMBER_OF_PEGS.times do
      loop do
        print info(:guess_a_color)
        color = gets.chomp.upcase
        if colorPool.include?(color)
          guessCurrent.concat(colorPool.values_at(color))
          break
        else
          puts info(:guess_warning)
        end
      end
    end
    guess_history(guessCurrent)
    return guessCurrent
  end
  # Records current guess into history.
  def guess_history(guessCurrent)
    self.guessCurrent = guessCurrent
    guessHistory.concat([guessCurrent])
  end

end

class CreatorPlayer < Creator
  # Prompt player to pick secret code.
  def create_secret()
    NUMBER_OF_PEGS.times do
      loop do
        print info(:create_a_secret_color)
        color = gets.chomp.upcase
        if colorPool.include?(color)
          secretColor.concat(colorPool.values_at(color))
          break
        else
          puts info(:guess_warning)
        end
      end
    end
    return secretColor
  end

end

class CreatorComputer < Creator
  # Auto generates secret code.
  def auto_generate_secret()
    NUMBER_OF_PEGS.times do
      color = colorPool.values.sample
      secretColor.append(color)
    end
    return secretColor
  end

end
