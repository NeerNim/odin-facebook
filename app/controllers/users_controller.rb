class UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all_except(current_user)        
  end

  def show
    @user = current_user
    @posts = @user.posts
  end

end
