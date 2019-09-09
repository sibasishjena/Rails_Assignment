class Employee < ApplicationRecord
    validates :name, presence: true, format: {with: /\A[a-zA-Z\.]+\z/, message: "only letters and \. is allowed"}
    validates :age, presence: true, numericality: {only_integer: true}
    validates :designation, presence: true
    validates :company, presence: true
end

#should_a_matcher.... done
#before after filters.... done
#binding.pry

#apis - create an api only app 
#rspecs for controllers and models..... done