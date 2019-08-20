# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook] 


  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy  
  has_many :friendships, dependent: :destroy

  has_many :friends, through: :friendships, source: :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true
  scope :all_except, ->(user) { where.not(id: user) }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name, user.last_name = auth.info.name.split(" ")[0] 
      user.gender = "gender"
      user.birthday = Time.now
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def sent_friend_requests
    Friendship.where(['user_id = ? and confirmed = ?', id, false])
  end

  def incoming_friend_requests
    Friendship.where(['friend_id = ? and confirmed = ?', id, false])
  end
end
