# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

    validates :email, uniqueness: true
    validates :email, presence: true

    has_many :submitted_urls,
    class_name: "ShortenedUrl",
    primary_key: :id,
    foreign_key: :user_id

end
