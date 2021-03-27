class UsersController < ApplicationController

    get '/users/signup' do
        if logged_in?
            redirect "/users/#{current_user.id}"
        else
            erb :'/users/signup'
        end
    end

    post '/users/signup' do
        if params[:username] == "" && params[:password] == ""
            redirect "/users/signup"
        else
            @user = User.create(username: params[:username], password: params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
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
            redirect '/users/login'
        end
    end

    get '/users/:id' do 
        if logged_in?
            @user = User.find(params[:id])
            erb :'/users/show'
        else
            redirect '/users/login'
        end
    end 

    get '/logout' do 
        if logged_in?
          session.clear
          redirect '/users/login'
        else
            redirect '/'
        end
    end 

end