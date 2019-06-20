class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: { message: 'Password can\'t be blank'}
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = self.find_by(username: username) # finds user by username
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(password) #checks that the password digest correponds to the password passed in
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16) #generates a random 16-digit session token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token #sets user instance session token attribute to a new random session token
    self.save! # saves to show errors if any
    self.session_token  #returns the session token (probably to be added to cookies or something)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end



# COOKIES:
# cookies[] => persist
# session[] => only persists for session
# ^ inside of
# flash[] => only persists for next request
# flash.new[] => only persists for current request (if rendering)

# when an #action calls render, render takes the @instance_variables stored in the #action that called it
# (not the action with the same name as :veiw, unless of course redirected)