module Toyable
    extend ActiveSupport::Concern

    included do 
        has_many :toys, as: :toyable #write the associations that you want to have in common
    end

    def recieve_toy(name) #common funtionality
        self.toys.find_or_create_by(name: name)
    end

end