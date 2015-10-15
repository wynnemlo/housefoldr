class User < ActiveRecord::Base
  validates_presence_of :email, :password_digest, :full_name
  has_many :items, -> { order("purchase_date DESC")}
  has_secure_password

end