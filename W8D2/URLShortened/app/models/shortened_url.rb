# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  short_url  :string
#  long_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord

    validates :long_url, uniqueness: true
    validates :long_url, presence: true

    belongs_to :submitter,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

    def self.random_code
    short_url = SecureRandom::urlsafe_base64
        until !ShortenedUrl.exists?(:short_url => short_url)
            short_url = SecureRandom::urlsafe_base64
        end
    short_url
    end

    def self.shorten_url(user,long_url)
        ShortenedUrl.create!(user_id: user.id, short_url: ShortenedUrl.random_code, long_url: long_url)
    end
    
end

