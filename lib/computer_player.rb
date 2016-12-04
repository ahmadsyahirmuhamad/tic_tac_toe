require 'forwardable'

require_relative 'logic'
require_relative 'player'

class ComputerPlayer
  extend Forwardable
  include Player

  def initialize mark
    super mark
    @game_strategy = Logic.new
  end

  def_delegators :@game_strategy, :next_move
end
