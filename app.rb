require_relative "lib/web_adapter"

require 'sinatra'
require 'json'

get '/' do 
  erb :index
end

get '/start' do 
  game = TicTacToe::WebAdapter::TicTacToeForWeb.new 
  game.start_game()

  {move_made: game.move_coords, game_over: game.over?(), winner: game.winner}.to_json
end

post '/play' do 
  game = TicTacToe::WebAdapter::TicTacToeForWeb.new 
  all_board_moves = JSON.parse(params[:moves_made]) 
  game.catch_up_game(all_board_moves)
  computer_move = game.computer_make_move() if !game.over?()

  {move_made: computer_move, game_over: game.over?(), winner: game.winner}.to_json
end