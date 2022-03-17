class UserComment < ApplicationRecord
  belongs_to :user_blog
  has_many :comment
end
