class User < ApplicationRecord
  has_secure_password

  has_many :user_blogs
  has_many :user_comments
  has_many :comments, through: :user_comments
  has_many :blogs, through: :user_blogs

  has_one_attached :profile_image
  has_one_attached :banner_image

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
