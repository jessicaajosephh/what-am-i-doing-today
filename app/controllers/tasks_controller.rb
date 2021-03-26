class TasksController < ApplicationController

#create

    get '/tasks/new' do
        if logged_in?
          erb :'/tasks/new'
        else
            redirect '/users/login'
        end
    end

    post '/tasks' do
        @task = Task.create(name: params[:name], description: params[:description])
        redirect "/tasks/#{@task.id}"
    end


#read

    get '/tasks/:id' do
        @task = Task.find(params[:id])
        erb :'/tasks/show'
    end

    get '/tasks' do
        @tasks = Task.all
        erb :'/tasks/index'
    end


#update

    get '/tasks/:id/edit' do
        @task = Task.find(params[:id])
        erb :'/tasks/edit'
    end

    post '/tasks/:id' do
        @task = Task.find(params[:id])
        @task.update(name: params[:name], description: params[:description])
        redirect "/tasks/#{@task.id}"
    end


#delete

    delete '/tasks/:id' do
        @task = Task.find(params[:id])
        @task.destroy 
        redirect '/tasks'
    end

end