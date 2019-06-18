# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#

class ArtworkShare < ApplicationRecord

    # validates :artwork_id, uniqueness: {scope: :viewer_id, message: "#{viewer.username} already follows artwork #{artwork.title}"}
    validate :ensure_scope_uniqueness

    belongs_to :artwork

    belongs_to :viewer, 
    class_name: 'User'

    def ensure_scope_uniqueness
        artwork_share = ArtworkShare.find_by(viewer_id: self.viewer_id, artwork_id: self.artwork_id)
        if artwork_share 
            # debugger
            raise "#{artwork.title} can't be seen by #{viewer.username} twice"
        end
    end
end
