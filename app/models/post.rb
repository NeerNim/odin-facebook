class Post < ApplicationRecord
  belongs_to :user

  validates :content, length: {maximum: 140}, presence: true
  validates :title, length: {minimum:10}, presence: true
end
