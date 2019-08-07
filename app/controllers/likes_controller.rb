class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]
  
  def create
    if already_liked?
      flash.now[:notice] = "You already liked this post"      
    else
      @post.likes.create(user_id:current_user.id)
    end
  end

  def destroy
    if !(already_liked?)
      flash.now[:notice] = "cannot unlike!"
    else
      find_like.destroy
    end
    redirect_to @post
  end

  private 
    def find_post
      @post = Post.find(params[:post_id])
    end

    def find_like
      @like = @post.likes.find(params[:id])
    end

    def already_liked?
      Like.where(user_id:current_user.id, post_id:params[:post_id]).exists?
    end
end
