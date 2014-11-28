require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/player"
require_relative "lib/unbeatableplayer"
require_relative "lib/commandlinedisplay"
require_relative "lib/application"

require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require 'json'


get '/' do 
  "Hello World!"
end

get '/start' do 

end