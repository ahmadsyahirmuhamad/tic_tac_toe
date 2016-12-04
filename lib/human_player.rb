require_relative 'player'

class HumanPlayer
  include Player

  def next_move(game)
    puts "Choose available step: #{game.board.get_available_steps}"
    game.board.display

    loop do
      step = input_step(game.board)
      if step.nil?
        puts "Try again!"
        puts "Choose available step: #{game.board.get_available_steps}"
      else
        return step
      end
    end
  end


private
  def input_step(board)
    user_input = STDIN.gets.chomp.to_i
    steps = board.get_available_steps
    steps.include?(user_input) ? user_input : nil
  end
end
