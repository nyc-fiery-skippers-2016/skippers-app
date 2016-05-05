class CreateSkippers < ActiveRecord::Migration
  def change
    create_table :skippers do |t|
      t.string :name, null: false, index: true, unique: true
      t.string :password
      t.integer :wingspan, null: false

      t.timestamps null: false
    end
  end
end
