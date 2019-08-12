class FriendshipsController < ApplicationController
  def new
  end

  def index
    @friends = current_user.friendships
  end

  def show
  end
end
