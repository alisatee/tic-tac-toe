module TicTacToe

class WinLogic

  def initialize(board)
    @board = board
  end

  def winner_exists?(player, move_coordinates)
    check_row(player, move_coordinates) || check_column(player, move_coordinates) || check_diagonals(player, move_coordinates)
  end

  private 

  def board_width
    @board.width_of_board
  end

  def check_row(player_piece, move_coordinates)
    row = move_coordinates.first
    @board.get_row(row).all? {|row_element| row_element == player_piece}
  end

  def check_column(player_piece, move_coordinates)
    column = move_coordinates.last
    @board.get_column(column).all? {|column_element| column_element == player_piece}
  end

  def check_diagonals(player_piece, move_coordinates)
    check_southeast_diag(player_piece) || check_northeast_diag(player_piece)
  end

  def check_southeast_diag(player_piece)
    @board.get_diagonal("SE").all?{|diag_elem| diag_elem == player_piece}
  end

  def check_northeast_diag(player_piece)
    @board.get_diagonal("NE").all?{|diag_elem| diag_elem == player_piece}
  end

end
end