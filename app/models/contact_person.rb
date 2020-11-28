class ContactPerson < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates :name, :surname, :phone, :email, :position, presence: true

  scope :filter_by_surname, -> (surname) { where("surname LIKE ?", "%#{surname}%") }
end
