module TicTacToe
  class Board 
    attr_reader :width_of_board, :blank_spaces
    attr_accessor :taken_spaces, :available_moves, :game_board
    
    def initialize(width_of_board)
      @width_of_board = width_of_board
      self.create_game_board()
    end

    def create_game_board
      @game_board = []
      @blank_spaces = @width_of_board ** 2
      @taken_spaces = []
      @available_moves = generate_all_moves(@width_of_board.times.to_a)
      @width_of_board.times do 
      @game_board << Array.new(@width_of_board)
      end
    end

    def reset_game_board
      self.create_game_board()
    end

    def is_full?
      @taken_spaces.length == @blank_spaces
    end

    def is_empty?
      @taken_spaces.length == 0
    end

    def get_row(row_index)
      @game_board[row_index]
    end

    def get_column(column_index)
      @game_board.transpose[column_index]
    end

    def get_diagonal(direction)
      diag = []
      i = 0
      while i < width_of_board do 
        diag << @game_board[i][(direction == "SE" ? i : ((width_of_board - 1) - i))]
        i += 1 
      end
      diag 
    end

    def in_bounds?(coordinates)
      coordinates.first < @width_of_board && coordinates.last < @width_of_board
    end

    def space_taken?(coordinates)
      @game_board[coordinates.first][coordinates.last] != nil 
    end

    def play_piece(piece, space)
      @game_board[space.first][space.last] = piece 
      @taken_spaces << space
      @available_moves.delete(space)
    end

    def generate_all_moves(array)
      array.product(array)
    end
  end
end

