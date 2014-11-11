module Tictactoe

class Board 
  attr_reader :game_board, :width_of_board, :blank_spaces
  attr_accessor :taken_spaces, :available_moves
  def initialize(width_of_board)
    @width_of_board = width_of_board
    self.create_game_board
  end

  def create_game_board
    @game_board = []
    @blank_spaces = width_of_board ** 2
    @taken_spaces = 0
    @available_moves = generate_all_moves(@width_of_board.times.to_a)
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

  def in_bounds?(x,y)
    x < @width_of_board && y < @width_of_board
  end

  def space_taken?(x,y)
    @game_board[x][y] != nil 
  end

  def play_piece(piece, space)
    x = space.first.to_i
    y = space.last.to_i 
    if in_bounds?(x,y) && !space_taken?(x,y)
      @game_board[x][y] = piece 
      @taken_spaces += 1
    else 
      return false 
    end
  end

  def generate_all_moves(array)
    array.product(array)
  end
end






end

if __FILE__ == $0
p board = Tictactoe::Board.new(3).is_full?
end