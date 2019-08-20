class NotificationsController < ApplicationController
  def new    
    @incoming_friend_requests = current_user.incoming_friend_requests
  end
end
