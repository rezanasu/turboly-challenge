class TasksController < ApplicationController
    before_action :authorized
    
    # Create new Task
    def create
        task = Task.create(
            title: params[:title],
            description: params[:description],
            dueDate: params[:dueDate],
            priority: params[:priority],
            status: params[:status],
            user_id: @user.id
        )
        render json: {task: task}
    end

    # Find All
    def index
        tasks = Task.where("user_id=?", @user.id)
        render json: {tasks: tasks}
    end

    # Update
    def update
        puts "masukk dong #{params[:id]}"
    end

    # Private method

    private
    def task_params
        
    end
end
