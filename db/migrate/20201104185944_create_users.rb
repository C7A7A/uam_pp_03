class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, :limit => 50
      t.string :surname, :limit => 100
      t.date :date_of_birth
      t.string :login, :limit => 50
      t.string :password, :limit => 150
      t.boolean :is_deleted
      t.belongs_to :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
