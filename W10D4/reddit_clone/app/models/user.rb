# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#

class User < ApplicationRecord

    attr_reader :password
    validates :password_digest, :username, :session_token, presence: true, uniqueness: true
    validates :password, length: { minimum: 7 }, allow_nil: true
    after_initialize :ensure_session_token

    has_many :subs,
    foreign_key: :moderator_id

    has_many :posts,
    foreign_key: :author_id

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user && user.valid_password?(password)
        return user
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def valid_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
        
    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    private

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end

end
