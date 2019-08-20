# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @users = User.all
    # # @posts = current_user.posts.all.order(created_at: :desc)
    # @posts = current_user.timeline
    if !(user = params[:user_id]&.to_i)
      @posts = current_user.feed
    elsif (user == current_user.id) ||
      (current_user.friends.include?(User.find_by_id(user)))
      @posts = Post.where(user_id: user)
    else
      flash.now[:warning] = "You can only see your and your friends' posts."
      @posts = current_user.feed
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Posts created!"
      redirect_to authenticated_root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end
