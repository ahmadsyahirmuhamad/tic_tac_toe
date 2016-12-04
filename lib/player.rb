module Player
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def play(board, step)
    board[step] = @mark
  end

  def to_s
    "(#{mark})"
  end
end
