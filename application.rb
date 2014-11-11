require_relative "board"
require_relative "game"
require_relative "player"
require_relative "unbeatableplayer"
require_relative "commandlinedisplay"

module Tictactoe
  class Application
    attr_reader :board 
    def initialize
      @display = Commandline_display.new
      @board = Board.new(3)
      @game = Game.new(@board)
      run_game
    end

    def run_game 
      @game.start_game
      @display.render_game_welcome



      until @game.over?
        if current_player == @game.player1
          @display.render_current_player(current_player.player_piece)
          @display.render_game_board(@board)
          coordinates = @display.prompt_for_turn
          @display.render_invalid_input_message && @display.prompt_for_turn if !@game.make_move(coordinates)
          @game.check_if_win(coordinates)
          @game.switch_players if !@game.over?
        else
          @display.render_current_player(current_player.player_piece)
          @game.player2.make_move(@game)
          @display.render_game_board(@board)
          @game.switch_players if !@game.over?
        end
      end
      @display.render_game_board(@board)
      @display.congratulate_winner(current_player.player_piece)

    end

    private
    def current_player
      @game.current_player
    end

  end
end



Tictactoe::Application.new