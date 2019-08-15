# frozen_string_literal: true

class FriendshipsController < ApplicationController

  def index
    @friendships = current_user.friends    
  end

  def new
    @friendships = Friendship.where(user: current_user, confirmed: false)
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:user_id], confirmed: false)
    if @friendship.save
      flash[:notice] = 'Friend Request Sent'
      redirect_to new_friendships_path
    else
      flash[:error] = 'Unable to send friend request'
      redirect_to users_path
    end
  end


  def update
    @friendship = Friendship.where(friend: current_user).find(params[:id])
    @friendship.update!(confirmed: true)
    flash[:notice] = 'Friendship confirmed'
    redirect_to friendships_path
  end
  
  
  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Remove friendship'
    redirect_to friendships_path
  end


end
