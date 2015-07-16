class User < ActiveRecord::Base
  validates_presence_of :email, :password_digest, :full_name
  has_many :items
  has_secure_password
end