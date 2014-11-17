module Tictactoe

class Player
  attr_reader :player_piece

  def initialize(player_piece)
    @player_piece = player_piece
  end
end
end