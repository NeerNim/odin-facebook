# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Your comment has been created'
      redirect_to user_comments_path
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :post_id)
  end
end
