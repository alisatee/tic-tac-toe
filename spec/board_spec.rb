require 'spec_helper'

module Tictactoe
  describe Board do 
    before :each do 
      @board = Board.new(3)
    end

    context '#initialize' do 
      it "should initialize a board with a width set to the provided value" do 
        expect(@board.width_of_board).to eq(3) 
      end
    end

    context '#create_game_board' do 
      it "should create a 'game board' that has the same number of rows as its width" do
        expect(@board.game_board.length).to eq(3)
      end
      it "should create a 'game board' that has the same number of columns as its width" do
        @board.game_board.each do |row|
          expect(row.length).to eq(3)
        end
      end
      specify "the difference between the initial blank spaces and taken spaces should be the value of blank spaces by default" do
        expect(@board.blank_spaces - @board.taken_spaces).to be(@board.blank_spaces)
      end 
      specify "available moves should contain all of the playable moves on the board" do
        @board.available_moves.each do |move|
          expect(@board.game_board[move.first][move.last]).to eq(nil)
        end
      end

    context '#reset_game_board' do
      it "should clear the game board" do 
        @board.game_board = [["X", "O", "X"],["X", "O", "X"],["X", "O", "X"]]
        @board.taken_spaces = 9 
        @board.reset_game_board
        expect(@board.game_board).to eq([[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]])
      end
      it "should reset taken_spaces back to 0" do 
        expect(@board.taken_spaces).to eq(0)
      end
    end

    context '#full' do 
      it "should return true when all of the board spaces are taken" do 
        @board.taken_spaces = 9
        expect(@board.is_full?).to be(true)
      end
    end

    context '#is_empty?' do 
      it "should return true if no spot on the board has been played" do 
        expect(@board.is_empty?).to be(true)
      end
    end

    context '#space_taken?' do 
      it "should return true if a space has a value other than nil in it" do 
        expect(@board.space_taken?([0,0])).to be(false)
        @board.play_piece("piece", [0,0])
        expect(@board.space_taken?([0,0])).to be(true)
      end
    end

    context '#in_bounds?' do 
      it "should return false if provided a value that doesn't exist on the board" do
        expect(@board.in_bounds?([0,9])).to be(false)
        expect(@board.in_bounds?([0,2])).to be(true)
      end
    end

    context '#play_piece' do 
      it "should 'place' a provided piece on the game board" do 
        @board.play_piece("hello", [0,1])
        expect(@board.game_board[0][1]).to eq("hello")
      end
      it "should increment taken_spaces by 1 every time a piece is added" do 
        expect{
          @board.play_piece("hello", [0,2])
          }.to change{@board.taken_spaces}.by(1)
      end
      it "should delete the played space from available_moves" do
        @board.play_piece("hello", [0,1])
        expect(@board.available_moves).to_not include([0,1])
      end
    end
    end
  end








end