require_relative "game"

module Tictactoe

class Unbeatable_player < Player 

  def make_move(game)
    @game = game 

    if @game.board.is_empty?
      random = go_randomly
      @game.make_move(random)
      @game.check_if_win(random)

    else
      coords = minimax(@game)
      @game.make_move(coords)
      @game.check_if_win(coords)

    end

  end

  private
  def minimax(game, depth = 0, best_score = {})
    return 1 if game.winner == self
    return -1 if game.winner == @game.player1
    return 0 if game.over?

    game.board.available_moves.each do |move|
      game_state = game.copy
      game_state.make_move(move)
      best_score[move] = -1 * minimax(game_state, depth + 1, {})
    end

    best_move = best_score.max_by{|key,value| value}[0]
    highest_minimax_score = best_score.max_by{ |key, value| value }[1]


    if depth == 0
      return best_move
    elsif depth > 0
      return highest_minimax_score
    end
    
  end

  def go_randomly
    @game.board.available_moves.sample
  end







end

end
