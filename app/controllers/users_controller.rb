class UsersController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  def index
    @users = User.all
    @friends = current_user.friendships
  end

  def new
    @user = User.new
  end
  
  def show
    @user = current_user
    @posts = @user.posts
  end

  def destroy
    @find_friend = current_user.friendships.find(params[:id])
    @find_friend.destroy
    flash[:notice] = 'Remove friendship'
    redirect_to friendships_path(current_user)
  end


end
