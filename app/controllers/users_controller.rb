class UsersController < ApplicationController

    get '/users/signup' do
        if logged_in?
            redirect "/users/#{current_user.id}"
        else
            erb :'/users/signup'
        end
    end

    post '/users/signup' do
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save 
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect "/users/signup"
        end
    end

    get '/users/login' do
        if logged_in?
            redirect to "/users/#{current_user.id}"
        else
            erb :'/users/login'
        end
    end

    post '/users/login' do
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            #flash[:notice] = "Before continuing, please signup"
            redirect '/users/login'
        end
    end

    get '/users/:id' do 
        @user = User.find(params[:id])
        erb :'/users/show'
    end 

    get '/logout' do 
        if logged_in?
          session.clear
          redirect '/'
        else
            redirect '/users/login'
        end
    end 

end