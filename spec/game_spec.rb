require_relative "spec_helper"
module TicTacToe
  describe Game do 
    before :each do 
      @game = Game.new(Board.new(3), Player.new("X"), UnbeatablePlayer.new("O") )
    end

  context '#initialize' do 
    it "should initialize with no winner" do 
      expect(@game.winner).to eq(nil)
    end
  end

  context '#start_game' do
    it "randomly selects a current player" do 
      allow(@game).to receive(:rand) { 4 }
      @game.start_game
      expect(@game.current_player).to eq(@game.player1)
    end
    it "if that player is the computer player, it will trigger the computer to make a random move" do
      expect {
        allow(@game).to receive(:rand) { 6 }
        @game.start_game
        }.to change{@game.board.available_moves.length}.by(-1)
    end
    it "if that player is the computer player, it will switch back to the other player upon move completion" do
      allow(@game).to receive(:rand) { 6 }
      @game.start_game
      expect(@game.current_player).to eq(@game.player1)
    end
  end

  context('#reset_game') do 
    it "should clear the board" do 
      @game.board.game_board = [["X", "O", "X"], ["O", "X", "O"], ["X", "O", "X"]]
      @game.reset_game
      expect(@game.board.game_board).to eq([[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    end
  end

  context('#valid_move?') do 
    it "should return false if a move is out of bounds" do 
      @game.start_game
      expect(@game.valid_move?([0,9])).to eq(false)
    end
    it "should return false if a move has been made already" do 
      @game.start_game
      @game.make_move([0,0])
      expect(@game.valid_move?([0,0])).to eq(false)
    end
    it "should return true if a move exists on the board" do 
      @game.start_game
      expect(@game.valid_move?([0,2])).to eq(true)
    end
  end

  context('#make_move') do 
    it "should place the current player's piece in the provided coordinates" do 
      @game.start_game
      @game.make_move([0,1])
      expect(@game.board.game_board[0][1]).to eq("X")
    end
  end

  context('#switch_players') do 
    it "should assign current_player to the player that is currently not current_player" do 
      allow(@game).to receive(:rand) { 4 }
      @game.start_game
      expect{@game.switch_players}.to change{@game.current_player}.from(@game.player1).to(@game.player2)
    end
  end

  context('#over?') do 
    it "should return the winner if there is one" do
      @game.start_game
      @game.winner = @game.player1
      allow(@game).to receive(:draw?) { false }
      expect(@game.over?).to eq(@game.player1)
    end
    it "should return true if there is a draw" do 
      @game.start_game
      allow(@game).to receive(:draw?){ true }
      expect(@game.over?).to eq(true)
    end
    it "should retun false if there is neither a win or a draw" do 
      expect(@game.over?).to eq(false)
    end
  end

  context('#check_if_win') do 
    it "if there is a winner, it should set the winner of the game to current_player" do 
      @game.start_game
      @game.board.game_board = [["X", "X", "X"], ["O", "X", "O"], [nil, nil, nil]]
      @game.check_if_win([0,0])
      expect(@game.winner).to eq(@game.player1)
    end
    it "should not set a winner if there isn't a winning combination" do 
      @game.start_game
      @game.check_if_win([0,0])
      expect(@game.winner).to eq(nil)
    end
  end

  context('#draw?') do 
    it "should return true if the board is full and there is no winner" do 
      @game.board.taken_spaces = [[0,0], [0,1], [0,2], [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]]
      expect(@game.draw?).to be(true)
    end
    it "should return false if there is no draw" do 
      expect(@game.draw?).to be(false)
    end
  end
  end
end

