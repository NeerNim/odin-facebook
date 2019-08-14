# frozen_string_literal: true

class FriendshipsController < ApplicationController

  def index
    @friends = current_user.friends
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Added a Friend'
      redirect_to friendships_path(current_user)
    else
      flash[:error] = 'Unable to add friend'
      redirect_to friendships_path(current_user)
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Remove friendship'
    redirect_to friendships_path
  end
end
