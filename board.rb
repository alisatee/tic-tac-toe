module Tictactoe

class Board 
  attr_reader :game_board, :width_of_board, :taken_spaces, :blank_spaces

  def initialize(width_of_board)
    @width_of_board = width_of_board
    @blank_spaces = width_of_board ** 2
    @taken_spaces = 0
    self.create_game_board
  end

  def create_game_board
    @game_board = []
    @width_of_board.times do 
    @game_board << Array.new(@width_of_board)
    end
  end

  def reset_game_board
    self.create_game_board
  end

  def is_full?
    @taken_spaces == @blank_spaces
  end

  def play_piece(piece, space)
    x_coord = space.first.to_i
    y_coord = space.last.to_i 
    @game_board[x_coord][y_coord] = piece 
    @taken_spaces += 1
  end

end






end

if __FILE__ == $0
p board = Tictactoe::Board.new(3).is_full?
end