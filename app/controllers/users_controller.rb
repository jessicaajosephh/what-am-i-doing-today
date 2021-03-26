class UsersController < ApplicationController

    get '/users/signup' do
        erb :'/users/signup'
    end

    post '/users/signup' do
        @user = User.new(username: params[:username], password: params[:password])
        if @user.username == "" && @user.password == ""
            redirect "/users/signup"
        else
            @user.save
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        end
    end

    get '/users/login' do
        erb :'/users/login'
    end

    post '/users/logn' do
        @user = User.find_by(username: params[:username])

    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'/users/show'
    end

end