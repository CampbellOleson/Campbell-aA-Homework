# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#

class Cat < ApplicationRecord
    COLORS = ['black','white','brown','orange','grey']

    validates :birth_date, :color, :sex, :name, presence: true
    validates :color, inclusion: { in: COLORS}

    def age
        Date.today - birth_date 
    end

end
