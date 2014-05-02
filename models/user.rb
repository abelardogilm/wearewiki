class User < ActiveRecord::Base
  has_many :projects, through: :user_projects
  has_many :posts

  before_create :set_auth_token

  has_secure_password

  class << self
    def password_matches?(username, password)
      user = User.find_by(username: username)
      return false if user.nil?

      user.authenticate(password)
    end
  end

  private

  def set_auth_token
    return if auth_token.present?

    begin
      self.auth_token = SecureRandom.hex(20)
    end while self.class.exists?(auth_token: self.auth_token)
  end

end

