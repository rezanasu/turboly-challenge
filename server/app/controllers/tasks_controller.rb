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
        @task = Task.find(params[:id])
        puts "masukk dong #{params[:task]}"
        @task.update(task_params)
        render json: {updatedTask: @task}
    end

    # Private method

    private
    
        def task_params
            params.permit(:title, :description, :dueDate, :priority, :status)
        end
end
