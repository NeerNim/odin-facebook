class UsersController < ApplicationController
  before_action :authenticate_user!

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

  def create
  end
end
