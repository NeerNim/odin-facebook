class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy  
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, :source => :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true
  scope :all_except, ->(user) { where.not(id: user) }

  def pending_friends
    Friendship.where(['friend_id = ? and confirmed = ?', id, false])
  end
end
