class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, :limit => 200
      t.integer :nip
      t.string :address, :limit => 200
      t.string :city, :limit => 100
      t.boolean :is_deleted
      t.belongs_to :industry, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
