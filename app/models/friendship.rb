class Friendship < ApplicationRecord
  after_create :create_inverse_relationship
  after_destroy :destroy_inverse_relationship
  
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  
  default_scope { where(confirmed: false) }

  validates_presence_of :user_id, :friend_id  
  validates :user_id, uniqueness: { case_sensitive: false, scope: :friend_id }

  private

  def create_inverse_relationship
    friend.friendships.create(friend: user)
  end

  def destroy_inverse_relationship
    friendship = friend.friendships.find_by(friend: user)
    friendship.destroy if friendship
  end


end
