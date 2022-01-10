require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player
  def initialize(length_board)
    Board.new(length_board)
    @player = Player.new
    @board = Board.new(length_board)
    @remaining_misses = @board.size / 2
  end
end
