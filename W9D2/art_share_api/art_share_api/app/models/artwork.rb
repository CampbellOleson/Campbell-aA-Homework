# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :title, uniqueness: { scope: :artist_id }

    belongs_to :artist,
    class_name: 'User',
    foreign_key: :artist_id

    has_many :artwork_shares,
    foreign_key: :artwork_id

    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
    
end


# Artwork

# artist_id  | title (string)
# 5          | mona lisa
# 8          | mona lisa ---allowed
# 5          | mona lisa ---not allowed
# 5          | stary night ---allowed