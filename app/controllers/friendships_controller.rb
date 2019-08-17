# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def index
    
  end
  
  def new 
    @pending_requests = current_user.pending_friends
    
  end
    
  def create
    @new_friendship = Friendship.new(friendship_params)    
    if @new_friendship.save!
    flash[:notice] = 'Confirmation sent'  
    redirect_to new_friendship_path
    else
    flash[:notice] = 'Cannot send twice'  
    redirect_to friendships_path
    end
  end

  def update
    @confirm_request = current_user.friendships.find(params[:id])
    @confirm_request.update(confirmed:true)
    flash[:notice] = 'You are now Friends'      
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Removed friendship.'
    redirect_to current_user
  end

  private

  def friendship_params
    params.require(:friendships).permit(:user_id, :friend_id, :confirmed)
  end

end


