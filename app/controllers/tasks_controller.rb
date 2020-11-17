class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def show
      task = params[:id]
      @task = Task.find(task)
      if @task.completed == false
        @message = "This task has not been completed yet"
      else
        @message = "Task is already completed"
      end
    end

    def new
      @task = Task.new
    end

    def create
      @task = Task.create(params_required)
      redirect_to task_path(@task)
    end

    def edit
      task = params[:id]
      @task = Task.find(task)
    end

    def update
      task = params[:id]
      @task = Task.find(task)
      @task.update(params_required)
      redirect_to task_path(@task)
    end

    def destroy
      task = params[:id]
      @task = Task.find(task)
      @task.destroy
      redirect_to root_path
    end

    private

    def params_required
      params.require(:task).permit(:title, :details, :completed)
    end
end
