module Tictactoe
require_relative "winlogic"
class Game
  attr_reader :board, :current_player, :winner 
  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @check_win = Win_logic.new(@board)
  end

  def start_game
    reset_game
    @current_player = rand(0..10) < 5 ? @player1 : @player2
  end

  def reset_game
    @board.reset_game_board
    @winner = nil 
  end

  def make_move(player, move_coordinates)
    @board.play_piece(player.player_piece, move_coordinates)
  end

  def switch_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def game_over?
    @winner || check_if_draw
  end

  def check_if_win(player, move_coordinates)
    if @check_win.winner_exists?(player.player_piece, move_coordinates)
      @winner = @current_player
    end
  end

  def check_if_draw 
    @board.is_full? 
  end

  def game_cycle(coordinates)
    if make_move(@current_player, coordinates)
      check_if_win(@current_player, coordinates)
      switch_players if @current_player != @winner 
    else
      return false 
    end
    true
  end
  
end

end
