class Company < ApplicationRecord
  belongs_to  :industry
  belongs_to  :user
  has_many    :notes
  has_many    :contact_people

  validates :name, :nip, :address, :city, presence: true
  validates :nip, numericality: true

end
