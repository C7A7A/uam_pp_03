class Company < ApplicationRecord
  belongs_to  :industry
  belongs_to  :user
  has_many    :notes
  has_many    :contact_people
end
