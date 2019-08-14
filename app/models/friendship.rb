class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  validates_presence_of :user_id, :friend_id
  validates_uniqueness_of :user_id, :scope => :friend_id

  # return true if the users are possibly pending friends
  def self.exists?(user, friend)    
  end
end
