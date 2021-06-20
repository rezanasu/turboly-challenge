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
        puts "#{params[:sortBy]} <<<<< INI QUERY PARAMS"
        @sortParam = params[:sortBy]
        
        if !@sortParam or @sortParam === ""
          @sortParam = 'created_at'
        elsif @sortParam === "dueDate"
          @sortParam = '"dueDate"'
        end
        tasks = Task.order(@sortParam).where("user_id=?", @user.id)
        render json: {tasks: tasks}
    end

    # Find by ID
    def show
        task = Task.find(params[:id])
        render json: {task: task}
    end

    # Find all due today tasks
    def deadline
        tasks = Task.where('"dueDate" =?', Date.today).where("user_id=?", @user.id)
        render json: {tasks: tasks}
    end

    # Update
    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        render json: {updatedTask: @task}
    end

    # DELETE
    def destroy
        @task = Task.find(params[:id])
        puts "Deleting task with id #{params[:id]}"
        @task.destroy
        render json: {deletedTask: @task}
    end

    # Private method

    private
    
        def task_params
            params.permit(:title, :description, :dueDate, :priority, :status)
        end
end
