# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

    has_many :enrollments,
    class_name: "Enrollment",
    primary_key: :id, 
    foreign_key: :student_id 

    has_many :enrolled_courses,
    through: :enrollments,
    source: :course

end


# ^l13 this is like saying join on user.id = enrollment.student_id

# user primary key -- user.id 

    # has_many #name of assc 
    # through #another assc
    # source  #name of assc/from class/where 'through' took you to

    # has_many #assc.
    # class name #associated class 
    # primary_key "self" key to assc 
    # foreign_key "associated class"