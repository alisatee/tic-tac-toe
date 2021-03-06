require_relative "winlogic"

module TicTacToe
  class Game
    attr_reader :board, :player1, :player2, :winner  
    attr_accessor :winner, :current_player
    
    def initialize(board, player1 = Player.new("X"), player2 = Player.new("O"))
      @player1 = player1
      @player2 = player2
      @board = board
      @check_win = WinLogic.new(@board)
      @winner = nil 
    end

    def start_game
      reset_game()
      choose_random_player()
      if @current_player == @player2 
        @player2.go_randomly(self)
        switch_players() 
      end
    end

    def choose_random_player
      @current_player = rand(0..10) < 5 ? @player1 : @player2
    end

    def reset_game
      @board.reset_game_board()
      @winner = nil 
    end

    def valid_move?(move_coordinates)
      @board.available_moves.include?(move_coordinates)
    end

    def make_move(move_coordinates)
      @board.play_piece(@current_player.player_piece, move_coordinates) && check_if_win(move_coordinates)
      move_coordinates
    end

    def switch_players
      @current_player = @current_player == @player1 ? @player2 : @player1
    end

    def over?
      @winner || draw?()
    end

    def check_if_win(move_coordinates)
      if @check_win.winner_exists?(@current_player.player_piece, move_coordinates)
        @winner = @current_player
        return true
      end
    end

    def draw? 
      @board.is_full?() && @winner == nil 
    end

    def copy
      Marshal.load(Marshal.dump(self))
    end
  end
end
