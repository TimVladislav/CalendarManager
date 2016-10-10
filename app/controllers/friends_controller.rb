class FriendsController < ApplicationController

  before_filter :user_signed
  before_action :find_friend_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @friends = current_user.friends
  end

  def show
    @u_friend = User.find(Friend.find(params[:id]).friend_id)
  end

  def new
    @friend = Friend.new
  end

  def edit
    
  end

  def create
    @friend_id = User.where("email = \"#{params[:friend].first.second}\"").first
    if @friend = Friend.new(friend_id: @friend_id.id)
      if @friend.save
        current_user.friends << @friend
        redirect_to @friend
      else
        render 'edit'
      end
    else
      render 'edit'
    end
  end

  def update
    if @friend.update(friend_params)
      redirect_to @friend
    else
      render 'edit'
    end
  end

  def destroy
    @friend.destroy
    redirect_to friends_path
  end

  private

  def user_signed
    if !user_signed_in? 
      redirect_to '/users/sign_in'
    end
  end

  def find_friend_by_id
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:friend_id)
  end

end
