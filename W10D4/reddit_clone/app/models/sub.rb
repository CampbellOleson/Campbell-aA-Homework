# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord

    validates :title, :description, :moderator, presence: true
 
    belongs_to :moderator,
    class_name: :User,
    foreign_key: :moderator_id

    has_many :post_subs,
    class_name: :PostSub,
    foreign_key: :sub_id

    has_many :posts,
    through: :post_subs,
    source: :post
    
end

