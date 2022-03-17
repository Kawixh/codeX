class User < ApplicationRecord
  has_many :user_blogs
  has_many :user_comments
  has_many :comments, through: :user_comments
  has_many :blogs, through: :user_blogs
end
