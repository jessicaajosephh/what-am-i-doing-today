require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SINATRA_SECRET']
  end

  get "/" do
    if logged_in?
      redirect "/users/#{session[:user_id]}"
    else
      erb :welcome
    end
  end

  helpers do

      def logged_in?
        !!session[:user_id]
      end

      def not_logged_in 
        !session[:user_id]
      end

      def current_user
        @current_user ||= User.find(session[:user_id])
      end

      def redirect_if_not_logged_in
        redirect '/users/login' if !logged_in?
      end
  end

end
