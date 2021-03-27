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
        current_user.tasks << @task
        redirect "/tasks"
    end


#read

    get '/tasks/:id' do
        if logged_in?
          @task = Task.find_by_id(params[:id])
          erb :'/tasks/show'
        else
          redirect '/users/login'
        end
    end

    get '/tasks' do
        if logged_in?
          @tasks = current_user.tasks
          erb :'/tasks/index'
        else
          redirect '/users/login'
        end
    end


#update

    get '/tasks/:id/edit' do
        if logged_in?
          @task = Task.find(params[:id])
          if current_user.id == @task.user_id
            erb :'/tasks/edit'
        else
            redirect '/users/login'
        end
    end
    end

    patch '/tasks/:id' do
        if logged_in?
          @task = Task.find(params[:id])
          @task.update(name: params[:name], description: params[:description])
          if @task.save
            redirect '/tasks'
          else
            redirect "/tasks/#{@task.id}/edit"
          end
        end
    end


#delete

    get '/tasks/:id/delete' do
        if logged_in?
        @task = Task.find(params[:id])
        if current_user.id == @task.user_id
            erb :'/tasks/delete'
        else
            redirect '/users/login'
        end
    end
    end

    delete '/tasks/:id' do
        if logged_in?
          @task = Task.find_by_id(params[:id])
            if @task.destroy 
                redirect '/tasks'
          else
            redirect '/users/login'
          end
        end
    end

end