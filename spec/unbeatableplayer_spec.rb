require_relative "spec_helper"
module TicTacToe
  describe UnbeatablePlayer do 
    before :each do 
      @board = Board.new(3)
    end
  context '#make_best_move' do 
    it "should always result in a tie when playing against itself" do 
      @game = Game.new(@board, UnbeatablePlayer.new("O"), UnbeatablePlayer.new("X")) 
      @game.start_game
      until @game.over? do 
        @game.current_player.make_best_move(@game)
        @game.switch_players
      end
      expect(@game.draw?).to eq(true)
    end
  end
  end
end
