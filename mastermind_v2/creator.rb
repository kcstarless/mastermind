require_relative "text_module"
require_relative "hint_module"

class Creator

  include TextContent
  include HintModule

  NUMBER_OF_PEGS = 4

  attr_accessor :secretColor, :colorPool, :guessCurrent, :guessHistory, :computerPool, :computerLockedColors, :temp

  def initialize
    @colorPool = ["RED", "GREEN", "BLUE", "YELLOW", "CYAN", "MAGENTA"]
    @computerPool = ["RED", "GREEN", "BLUE", "YELLOW", "CYAN", "MAGENTA"]
    @computerLockedColors = []
    @secretColor = []
    @guessCurrent = []
    @guessHistory = []
    @temp = ["R".red]
  end

  def guess_computer_secret()
    NUMBER_OF_PEGS.times do
      guessCurrent.append(computerPool[0].slice(0).colorize(computerPool[0].downcase.to_sym))
    end

    currentSum = hint(secretColor, guessCurrent).sum
    puts currentSum
    currentSum.times {computerLockedColors.append(computerPool[0])} if currentSum > 0
    computerPool.pop(0) if currentSum == 0
    puts computerLockedColors
    puts temp
  end

  def guess_secret()
    guessCurrent = Array.new
    NUMBER_OF_PEGS.times do
      loop do
        print info(:guess_a_color)
        color = gets.chomp.upcase
        if colorPool.include?(color)
          guessCurrent.append(color.slice(0).colorize(color.downcase.to_sym))
          break
        else
          puts info(:guess_warning)
        end
      end
    end
    self.guessCurrent = guessCurrent
    guessHistory.concat([guessCurrent])
    return guessCurrent
  end

end

class CreatorPlayer < Creator

  def create_secret()
    NUMBER_OF_PEGS.times do
      loop do
        print info(:create_a_secret_color)
        color = gets.chomp.upcase
        if colorPool.include?(color)
          secretColor.append(color.slice(0).colorize(color.downcase.to_sym))
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

  def auto_generate_secret()
    NUMBER_OF_PEGS.times do
      color = colorPool.sample
      secretColor.append(color.slice(0).colorize(color.downcase.to_sym))
    end
  end

end
