# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  answer_choice_id :integer
#  user_id          :integer
#

class Response < ApplicationRecord

    validates :answer_choice_id, presence:true
    validates :user_id, presence:true

    has_one :respondent,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

    has_many :answer_choices,
    class_name: "AnswerChoice",
    primary_key: :id,
    foreign_key: :answer_choice_id

    has_one :question,
    through: :answer_choices,
    source: :question

    has_many :sibling_responses,
    through: :question,
    source: :responses

    def sibling_responses
        
    end

end
