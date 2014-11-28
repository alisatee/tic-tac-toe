require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/player"
require_relative "lib/unbeatableplayer"
require_relative "lib/commandlinedisplay"
require_relative "lib/application"

require 'sinatra'
require 'json'


get '/' do 
  
  erb :index
end

get '/start' do 

end