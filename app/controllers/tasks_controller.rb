class TasksController < ApplicationController

#create

    get '/tasks/new' do
        redirect_if_not_logged_in
        erb :'/tasks/new'
    end

    post '/tasks' do
        @task = Task.create(name: params[:name], description: params[:description])
        current_user.tasks << @task
        #flash[:notice] = "Task has been succesfully created"
        redirect "/tasks"
    end


#read

    get '/tasks/:id' do
        redirect_if_not_logged_in
        @task = Task.find_by_id(params[:id])
        erb :'/tasks/show'
    end

    get '/tasks' do
        redirect_if_not_logged_in
        @tasks = current_user.tasks
        erb :'/tasks/index'
    end


#update

    get '/tasks/:id/edit' do
        redirect_if_not_logged_in
        @task = Task.find(params[:id])
        redirect_if_not_authorized
        erb :'/tasks/edit'
    end

    patch '/tasks/:id' do
        redirect_if_not_logged_in 
        @task = Task.find(params[:id])
        redirect_if_not_authorized 
        @task.update(name: params[:name], description: params[:description])
        redirect "/tasks/#{@task.id}"
    end


#delete

    get '/tasks/:id/delete' do
        redirect_if_not_logged_in
        @task = Task.find(params[:id])
        redirect_if_not_authorized
        erb :'/tasks/delete'
    end

    delete '/tasks/:id' do
        redirect_if_not_logged_in
        @task = Task.find_by_id(params[:id])
        redirect_if_not_authorized 
        @task.destroy 
        redirect '/tasks'
    end

end