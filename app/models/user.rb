class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true
end
