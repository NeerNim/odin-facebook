# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    @comment = @post.comments.create(comment_params)
    if @post.save
      flash[success] = "Posts created!"
      redirect_to @post
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
