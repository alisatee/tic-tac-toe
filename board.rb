module Tictactoe

class Board 

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
    #Should space be an array of two numbers? 
    #Piece is either an "X" or an "O"
  end

end






end

p board = Tictactoe::Board.new(3).is_full?
