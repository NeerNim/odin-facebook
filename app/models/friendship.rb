class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  
  default_scope { where(confirmed: false) }

  validates_presence_of :user_id, :friend_id  
  validates :user_id, uniqueness: { case_sensitive: false, scope: :friend_id }

end
