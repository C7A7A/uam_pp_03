class User < ApplicationRecord
  belongs_to  :role
  has_many    :companies
  has_many    :notes
  has_many    :contact_people
end
