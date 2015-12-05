class User < ActiveRecord::Base
  before_create :generate_authentication_token!
	has_secure_password
  validates :auth_token, uniqueness: true
  validates :email, uniqueness: true
	has_many :trips

  def generate_authentication_token!
    begin
      self.auth_token = Digest::SHA1.hexdigest Time.now.to_s
    end while self.class.exists?(auth_token: auth_token)
  end
end
