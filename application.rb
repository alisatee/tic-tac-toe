require_relative "board"
require_relative "game"
require_relative "player"
require_relative "unbeatableplayer"
require_relative "commandlinedisplay"

module Tictactoe
  class Application
    attr_reader :board 
    def initialize
      @player1 = Player.new("X")
      @player2 = Unbeatable_player.new("O")
      @display = Commandline_display.new
      @board = Board.new(3)
      @game = Game.new(@player1, @player2, @board)
      run_game
    end

    def run_game 
      @game.reset_game 
      @game.start_game
      @display.render_game_welcome 

      until @game.game_over? do 
      @display.render_game_board(@board)
      coordinates = @display.prompt_for_turn(@game.current_player.player_piece)
      @game.make_move(@game.current_player, coordinates)
      @game.check_if_win(@game.current_player.player_piece, coordinates)
      @game.current_player != @game.winner ? @game.switch_players : true 
      end
      @game.winner ? @display.congratulate_winner(@game.winner.player_piece) : @display.announce_draw
      @display.render_game_board(@board)
      @display.prompt_to_play_again == "Y" ? run_game : "Bye!"
    end

  end
end



Tictactoe::Application.new