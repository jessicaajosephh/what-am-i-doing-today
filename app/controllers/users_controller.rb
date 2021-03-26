class UsersController < ApplicationController

    get '/users/signup' do
        erb :'/users/signup'
    end

    post '/users/signup' do
        @user = User.create(username: params[:username], password: params[:password])
        redirect "/users/#{@user.id}"
    end

    get '/users/:id' do
        #erb :'/users/show'
        "show page"
    end

end