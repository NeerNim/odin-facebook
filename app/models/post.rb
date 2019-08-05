class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :content, length: {maximum: 140}, presence: true
  validates :title, length: {minimum:10}, presence: true
end
