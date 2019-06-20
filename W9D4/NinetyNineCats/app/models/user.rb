require 'bcrypt'

class User < ApplicationRecord
    attr_reader :password
    after_initialize :reset_session_token!
    validates :password_digest, :user_name, :session_token, presence: true, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: nil}
   
    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        return user if user && user.is_password?(password)
    end

    def reset_session_token!
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
        self.save!
    end

    def is_password?(password) 
        BCrypt::Password.new(password_digest).is_password?(password)
    end
    
end