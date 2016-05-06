class CreateSkippers < ActiveRecord::Migration
  def change
    create_table :skippers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest
      t.integer :wingspan, null: false

      t.timestamps null: false
    end
    add_index :skippers, :name, unique: true
  end
end
