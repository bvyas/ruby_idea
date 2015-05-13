class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :likes
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
   validates :name, :alias, :email, :password, presence: true, length: { in: 2..20 }
   validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
   validates :password_confirmation, presence: true
end
