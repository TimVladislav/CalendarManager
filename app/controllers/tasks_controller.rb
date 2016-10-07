class TasksController < ApplicationController
 #before_filter :user_signed
  before_action :find_task_by_id, only: [:show, :edit, :update, :destroy]
  def show

  end
  def new
    @tast = Task.new
  end
  def edit

  end
  def create
    @task = Task.new(task_params)
    @task.owner = current_user.email
    if @task.save
      redirect_to @task
    else
      render 'edit'
    end
  end
  def update
    @task = Task.update(task_params)
    if @task.update
      redirect_to @task
    else
      render 'edit'
    end
  end
  def destroy
    @task.destroy
    redirect_to current_user
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :dt)
  end

  def user_signed
    user_signed_in? unless redirect_to 'root'
  end

  def find_task_by_id
    @task = Task.find(params[:id])
  end
end
