=begin
WELCOME to Mastermind!
----------------------
Play a game

=end

require_relative "text_module"
require_relative "game_module"
require_relative "display_module"
require_relative "creator"
require_relative "hint_module"

require 'colorize'


class Game
include TextContent
include GameModule
include DisplayModule
include HintModule

  def play_game
    puts game_info
    game_mode
  end

end

Game.new.play_game
