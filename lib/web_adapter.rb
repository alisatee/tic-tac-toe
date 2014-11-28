require_relative "board"
require_relative "game"
require_relative "player"
require_relative "unbeatableplayer"
require_relative "commandlinedisplay"

module TicTacToe
  module WebAdapter
    class WebAdapterConfig
      attr_reader :game, :move_coords 

      def initialize
        @game = Game.new(Board.new(3), Player.new("X"), UnbeatablePlayer.new("O"))
      end

      def start_game
        @game.choose_random_player()

        if @game.current_player == @game.player2
          @move_coords = @game.player2.go_randomly(@game)
        end
      end

      def recieve_response(board_state)

        @game = Game.new(Board.new(3), Player.new("X"), UnbeatablePlayer.new("O"))
        @game.board.game_board = params[:game_board]
        @game.board.taken_spaces = params[:taken_spaces]
        @game.board.available_moves = params[:available_moves]
        @game.player2.make_best_move(@game)


      end

      def make_move_for_player(coords_picked)

      end

    end
  end
end