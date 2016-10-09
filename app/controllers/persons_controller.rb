class PersonsController < ApplicationController
  before_action :sign_in, only: [:profile, :index, :edit, :update]

  def profile
    @user = current_user
  end
  def index
    @tasks = Position.where("user_id = #{current_user.id}")
  end
  def edit
  end
  def update
    if current_user.update(user_params)
      redirect_to '/persons/profile'
    else
      redirect_to 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :second_name, :birthday, :photo)
  end

  def sign_in
    if !(user_signed_in?)
      redirect_to '/users/sign_in'
    end
  end
end
