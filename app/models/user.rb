class User < ApplicationRecord
  has_secure_password

  has_many :user_blogs
  has_many :user_comments
  has_many :comments, through: :user_comments
  has_many :blogs, through: :user_blogs

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
