class User < ApplicationRecord
  belongs_to  :role
  has_many    :companies
  has_many    :notes
  has_many    :contact_people

  has_secure_password

  validates :name, :surname, :date_of_birth, :login, :password_digest, presence: true
  validates :login, uniqueness: true

  before_validation :default_role, on: [:create, :register]

  private
    def default_role
      regular = Role.find_by(name: 'regular')
      self.role_id ||= regular.id
    end
end
