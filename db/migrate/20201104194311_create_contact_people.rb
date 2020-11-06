class CreateContactPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_people do |t|
      t.string :name, :limit => 50
      t.string :surname, :limit => 100
      t.string :phone, :limit => 20
      t.string :email, :limit => 150
      t.string :position, :limit => 100
      t.boolean :is_deleted
      t.belongs_to :company, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
