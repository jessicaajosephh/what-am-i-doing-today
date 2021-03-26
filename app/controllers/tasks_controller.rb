class TasksController < ApplicationController

#create
    get '/tasks/new' do
        erb :'/tasks/new'
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


#update



#delete

end