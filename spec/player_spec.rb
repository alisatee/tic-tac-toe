require_relative "spec_helper"

module TicTacToe
  describe Player do 
    context '#initialize' do 
      it "should initalize a player with their respective player piece" do 
        player1 = Player.new("yellow")
        player2 = Player.new("green")
        expect(player1.player_piece).to eq("yellow")
        expect(player2.player_piece).to eq("green")
      end
    end
  end
end
