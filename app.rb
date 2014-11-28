require_relative "lib/web_adapter"


require 'sinatra'
require 'json'


get '/' do 
  erb :index
end

get '/start' do 
  game = TicTacToe::WebAdapter::WebAdapterConfig.new 
  game.start_game()
  {move_made: game.move_coords}.to_json
end

post '/play' do 
  data = JSON.parse(params[:moves_made]) 

  game = TicTacToe::WebAdapter::WebAdapterConfig.new 

  data.each do |move|
    player = move.first 
      if player == "player1"
        game.game.current_player = game.game.player1
      else
        game.game.current_player = game.game.player2
      end 
    game.game.make_move(move.last)

  end
  p game.game
  game.game.current_player = game.game.player2
  move_made = game.game.player2.make_best_move(game.game) 

  {move_made: move_made}.to_json
end