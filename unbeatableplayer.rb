module Tictactoe

class Unbeatable_player < Player 

  def go_randomly(game)
  x_coord = rand(0..2)
  y_coord = rand(0..2)

  if game.board.game_board[x_coord][y_coord] != nil && !game.game_over?
    go_randomly(game)
  else
  p x_coord
  p y_coord

  game.game_cycle([x_coord,y_coord])
  end

  end







end

end
