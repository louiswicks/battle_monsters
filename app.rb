require 'sinatra/base'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    'Testing infrastructure working!'
    erb(:index)
  end

  get '/play' do
    @player_one = session[:player_one]
    @player_two = session[:player_two]
    erb :play
  end

  post '/names' do
    session[:player_one] = params[:player_one]
    session[:player_two] = params[:player_two]
    redirect '/play'
  end

  run! if app_file == $0

end
