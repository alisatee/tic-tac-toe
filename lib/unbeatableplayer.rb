require_relative "game"

module TicTacToe
  class UnbeatablePlayer < Player 

    def make_best_move(game)
      if game.board.taken_spaces.length != 1
        game.make_move(minimax(game))
      else
        make_second_move(game)
      end
    end

    def go_randomly(game)
      game.make_move(game.board.available_moves.sample)
    end

    def make_second_move(game)
      best_move_key = {
        [0,0]=> [1,1],
        [0,1]=> [0,0],
        [0,2]=> [1,1],
        [1,0]=> [0,0],
        [1,1]=> [0,0],
        [1,2]=> [0,1],
        [2,0]=> [1,1],
        [2,1]=> [0,1],
        [2,2]=> [1,1]
      }
      best_move = best_move_key[game.board.taken_spaces[0]]
      game.make_move(best_move)
    end

    def minimax(game_state, depth = 0, scores = {})
      return 0 if game_state.draw?()
      return -1 if game_state.over?()

      game_state.board.available_moves.each do |move|
        game_clone = game_state.copy
        game_clone.make_move(move)
        game_clone.switch_players()
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
