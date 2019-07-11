require 'capybara'
require 'sinatra'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base

  enable :sessions

    get '/' do
      erb(:intro)
    end

    get '/players' do
      erb(:players)
    end

    post '/names' do
      $player_1 = Player.new(params[:player_1])
      $player_2 = Player.new(params[:player_2])
      redirect '/play'
    end

    get '/play' do
      @player_1 = $player_1
      @player_2 = $player_2
      erb(:play)
    end

    get '/attack' do
      @player_1 = $player_1
      @player_2 = $player_2
      Game.new.attack(@player_2)
      erb(:attack)
    end

    run! if app_file == $0
end
