class User < ApplicationRecord
  belongs_to  :role
  has_many    :companies
  has_many    :notes
  has_many    :contact_people

  has_secure_password

  validates :name, :surname, :date_of_birth, :login, :password, presence: true
  validates :login, uniqueness: true
end
