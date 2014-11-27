module Tictactoe

class Win_logic

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
    column_transposed = move_coordinates.last
    @board.game_board.transpose[column_transposed].each do |space|
       if space != player_piece
        return false
        break
      end 
    end
    true 
  end

  def check_diagonals(player_piece, move_coordinates)
    check_southeast_diag(player_piece) || check_northeast_diag(player_piece)
  end

  def check_southeast_diag(player_piece)
    i = 0 
    while i < board_width do 
      if @board.game_board[i][i] != player_piece
        return false
        break
      end
     i += 1
    end
    true
  end

  def check_northeast_diag(player_piece)
    i = 0
    while i < board_width do 
      if @board.game_board[i][(board_width - 1) - i] != player_piece
        return false
        break
      end
      i += 1
    end
    true 
  end

end
end