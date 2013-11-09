class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	has_secure_password
	validates :password, length: { minimum: 6 }

	def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def self.check_signup_username(username)
    if !username
      response = ['red', "Please specify a username"]
    else
      response = ['green', "This username is free"]
    end
    response
  end

  def self.check_signup_email(email)
  end

  def self.check_signup_pw(pw)
  end

  def self.check_signup_pw_confirmation(pw_confirm)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
