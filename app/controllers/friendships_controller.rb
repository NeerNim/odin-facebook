# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends
  end
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Added friend.'
      redirect_to users_path
    else
      flash[:error] = 'Unable to add friend.'
      redirect_to users_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Removed friendship.'
    redirect_to current_user
  end
end
