class Board
  attr_accessor :state

  def initialize(state=nil)
    @state = (state || Array.new(9))
  end

  def valid_step?(step)
    self[step].nil?
  end

  def get_available_steps
    @state.each.with_index(1).select { |mark, index| mark.nil? }.map { |mark, index| index }
  end

  def new_board(step, mark)
    board = self.class.new @state.dup
    board[step] = mark
    board
  end

  def [](step)
    raise IndexError, "Bad step: #{step}" unless step.between?(1, 9)
    @state[step - 1]
  end

  def []=(step, mark)
    raise ArgumentError, "step already taken: #{step}" unless valid_step? step
    @state[step - 1] = mark
  end

  def full?
    !@state.include?(nil)
  end

  def display
    puts
    @state.each.with_index do |value, pos|
      value ||= (pos + 1)
      if pos % 3 == 1
        print "| #{value} |"
      else
        print " #{value} "
      end

      puts "\n---+---+---" if [2, 5].include? pos
    end
    puts
  end
end
