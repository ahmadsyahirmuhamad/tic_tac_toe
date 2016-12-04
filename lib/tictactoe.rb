require_relative 'board'
require_relative 'game'
require_relative 'human_player'
require_relative 'computer_player'

################################################
class Tictactoe < Game

  WINNING_LINES = [
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 5, 9], [3, 5, 7]
  ]

  def initialize(players, board=nil)
    board ||= Board.new
    super board, players
  end

  def winner
    WINNING_LINES.each do |winning_line|
      @players.each do |player|
        return player if winning_line.all? { |step| @board[step] == player.mark }
      end
    end

    nil
  end

  def draw?
    @board.full? && winner.nil?
  end

  def new_game(step)
    board = @board.new_board step, current_player.mark
    self.class.new @players.rotate, board
  end
end
