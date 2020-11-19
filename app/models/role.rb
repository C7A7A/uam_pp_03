class Role < ApplicationRecord
  has_many :users

  before_save :default_role

  private
  def default_role
    regular = Role.find_by(name: 'regular')
    self.role_id ||= regular.id
  end
end
