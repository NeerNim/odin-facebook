# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def index
    @friendships = current_user.friendships.where(confirmed: true)
  end

  def new
    @incoming_friend_requests = current_user.incoming_friend_requests
  end

  def create
    @new_friendship = Friendship.new(user: current_user, friend_id: params[:friend_id])
    if @new_friendship.save!
      flash[:notice] = 'Confirmation sent'
    else
      flash[:notice] = 'Cannot send twice'
    end
    redirect_to users_path
  end

  def update
    @confirm_request = current_user.incoming_friend_requests.find(params[:id])
    @confirm_request.confirm
    flash[:notice] = 'You are now Friends'
    redirect_to new_friendship_path
  end

  def destroy
    @friendship = Friendship
      .where(friend: current_user)
      .or(Friendship.where(user: current_user))
      .find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Removed friendship.'
    redirect_to new_friendship_path
  end
end
