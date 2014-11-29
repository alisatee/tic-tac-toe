require_relative "board"
require_relative "game"
require_relative "player"
require_relative "unbeatableplayer"
require_relative "commandlinedisplay"

module TicTacToe
  module WebAdapter
    class TicTacToeForWeb
      attr_reader :game, :move_coords 

      def initialize
        @game = Game.new(Board.new(3), Player.new("X"), UnbeatablePlayer.new("O"))
      end

      def start_game
        @game.current_player = @game.player2
        @move_coords = @game.player2.go_randomly(@game)

        p @game
      end

      def catch_up_game(moves)
        moves.each do |move|
          player = move.first
          move = move.last
          player == "player1" ? @game.current_player = @game.player1 : @game.current_player = @game.player2
          @game.make_move(move)
        end
      end

      def computer_make_move
        @game.current_player = @game.player2
        @game.player2.make_best_move(@game)
      end

      def over?
        @game.over?()
      end

      def winner
        @game.winner()
      end
    end
  end
end