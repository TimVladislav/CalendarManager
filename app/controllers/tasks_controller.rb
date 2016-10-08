class TasksController < ApplicationController
  before_filter :user_signed
  before_action :find_task_by_id, only: [:show, :edit, :update, :destroy]
  before_action :owner , only: [:edit, :update]
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
      current_user.tasks << @task
      redirect_to @task
    else
      render 'edit'
    end
  end
  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end
  def destroy
    @task.destroy
    redirect_to '/'
  end
  def share
    @u_share = params[:email]
    @u_task = params[:id]
    if @u_share_id = User.where("email = \"#{@u_share}\"").first
      @u_share_id.tasks << Task.where("id = #{@u_task}")
    end
    redirect_to '/'
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :dt)
  end

  def user_signed
    if !user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def find_task_by_id
    @task = Task.find(params[:id])
  end

  def owner
    if !(@task.owner == current_user.email)
      redirect_to @task
    end
  end
end
