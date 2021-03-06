# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string           not null
#  content    :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

    has_many :post_subs,
    class_name: :PostSub,
    foreign_key: :post_id

    has_many :subs,
    through: :post_subs

    belongs_to :author,
    class_name: :User,
    foreign_key: :author_id

end
