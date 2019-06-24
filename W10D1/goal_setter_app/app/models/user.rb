class User < ApplicationRecord

    attr_reader :password
    validates :username, :password_digest, :session_token, presence: true
    validates :username, :session_token, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_nil: true 
    after_initialize :ensure_session_token

    has_many :comments
    has_many :goals
    
    def self.find_by_credetials(username, password)
        user = User.find_by(username: username)
        user && is_password?(password) ? user : nil 
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(@password)
    end

end