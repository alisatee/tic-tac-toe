require 'spec_helper'
module Tictactoe
  describe Win_logic do 
    before :each do 
      @board = Board.new(3)
      @win = Win_logic.new(@board)
    end

  context '#winner_exists?' do 
    it "should return true if there exists three across on a board after the given player has made a move" do 
      @board.game_board = [["X", "X", "X"], ["O", "X", "O"], [nil, nil, nil]]
      expect(@win.winner_exists?("X", [0,1])).to be(true)
    end
    it "should return true if there exists three across in a column" do
      @board.game_board = [["O", "X", "X"], ["O", "X", "O"], ["O", nil, nil]]
      expect(@win.winner_exists?("O", [0,0])).to be(true)
    end
    it "should return true if there exists three across diagonally" do 
      @board.game_board = [["X", "O", "X"], ["O", "X", "O"], ["O", nil, "X"]]
      expect(@win.winner_exists?("X", [0,0])).to be(true)
    end
    it "should return true if there exists three across reverse diagonally" do 
      @board.game_board = [["nil", "O", "O"], ["X", "O", "O"], ["O", nil, "X"]]
      expect(@win.winner_exists?("O", [1,1])).to be(true)
    end
    it "should return false if there isn't a win on the board" do 
      @board.game_board = [["nil", "O", "X"], ["X", "X", "O"], ["O", nil, "X"]]
      expect(@win.winner_exists?("O", [1,1])).to be(false)
    end
  end
end

end
