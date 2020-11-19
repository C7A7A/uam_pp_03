class ChangeCompaniesNipDatatype < ActiveRecord::Migration[6.0]
  def change
    change_column :companies, :nip, :bigint
  end
end
