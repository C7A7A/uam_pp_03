class Company < ApplicationRecord
  belongs_to  :industry
  belongs_to  :user
  has_many    :notes
  has_many    :contact_people

  validates :name, :nip, :address, :city, presence: true
  validates :nip, numericality: true

  scope :filter_by_industry, ->  (industry_id) { where(industry_id: industry_id) }
  scope :filter_by_date, -> (created_at) { where("DATE(created_at) = ?", created_at) }
end
