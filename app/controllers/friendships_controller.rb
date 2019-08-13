def create
  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  if @friendship.save
    flash[:notice] = "Add a Friend"
    redirect_to users_path
  else
    flash[:error] = "Unable to add friend"
    redirect_to users_path
  end
end