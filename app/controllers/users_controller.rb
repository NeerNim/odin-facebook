class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @friends = current_user.friendships
  end

  def create
    @friend_id = Friendship.find(params[:friend_id])
    @user = User.find(params[:id])
    if friends.include(@friend_id)
      flash.now[:notice] = "You already sent a request"
    else
      current_user.friendships.create(friend_id:@user.id)
    end
  end
  def show
    @user = User.find(params[:id])
  end
end
