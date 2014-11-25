require_relative "game"

module Tictactoe
  class Unbeatable_player < Player 

    def make_best_move(game)
      game.make_move(minimax(game))
    end

    def go_randomly(game)
      game.make_move(game.board.available_moves.sample)
    end

    def minimax(game_state, depth = 0, scores = {})
      return 0 if game_state.draw?
      return -1 if game_state.over?

      game_state.board.available_moves.each do |move|
        game_clone = game_state.copy
        game_clone.make_move(move)
        game_clone.switch_players
        scores[move] = -1 * minimax(game_clone, depth + 1, {})
      end
    
      highest_score = scores.max_by { |key, value| value }[1]
      best_move = scores.max_by { |key, value| value }[0]

      if depth == 0
        return best_move
      elsif depth > 0
        return highest_score
      end
    end
  end
end
