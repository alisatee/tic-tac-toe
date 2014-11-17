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
        @display.render_current_player(@game.current_player.player_piece)
        user_input = display_prompt_for_input
        if @game.valid_move?(user_input)
          @game.make_move(user_input) 
          @game.switch_players
          @game.player2.make_best_move(@game) if !@game.over?
          @game.switch_players
        else
          @display.render_invalid_input_message 
        end
      end

      end_game
    end

    def display_prompt_for_input
      @display.render_game_board(@board)
      @display.prompt_for_turn
    end

    def end_game
      @display.render_game_board(@board)
      @game.draw? ? @display.announce_draw : @display.congratulate_winner(@game.winner.player_piece)
      run_game if @display.prompt_to_play_again == "Y"
    end

    private
    def current_player
      @game.current_player
    end

  end
end



Tictactoe::Application.new