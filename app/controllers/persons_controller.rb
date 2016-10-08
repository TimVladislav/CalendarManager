class PersonsController < ApplicationController
  before_action :sign_in, only: [:profile, :index]

  def profile
    @user = current_user
  end
  def index
    @tasks = current_user.tasks
  end
  def edit
  end
  def update
  end

  private

  def sign_in
    if !(user_signed_in?)
      redirect_to '/users/sign_in'
    end
  end
end
