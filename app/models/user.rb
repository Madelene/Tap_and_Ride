class User < ActiveRecord::Base
  has_secure_password
  has_many :trips
  validates :identifier, uniqueness: true 
end
