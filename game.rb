module Tictactoe

class Game
  attr_reader :board 
  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def start_game

  end

  def reset_game

  end

  def make_move(player, move_coordinates)
    @board.play_piece(player.player_piece, move_coordinates)


    # When someone makes a move, and we need to check for a win, we only need to check 
    # that specific row/column/diagonal(?) that the move was made in. 
  end

  def game_over?
    
  end

  def get_winner

  end

  def check_if_win(player, move_coordinates)
    check_row(player, move_coordinates) || check_column(player, move_coordinates) || check_diagonals(player, move_coordinates)
  end

  def check_if_draw 

  end

  private 

  def board_width
    @board.width_of_board
  end

  def check_row(player_piece, move_coordinates)
    row = move_coordinates.first
    @board.game_board[row].each do |space| 
      if space != player_piece
        return false
        break
      end 
    end
    true 
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

if __FILE__ == $0
p board = Tictactoe::Board.new(3).is_full?
end