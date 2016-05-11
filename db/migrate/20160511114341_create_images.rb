class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url, null: false
      t.string :alt_text
      t.references :imageable, polymorphic: true, index: true
      # t.integer :imageable_id
      # t.string :imageable_type

      t.timestamps null: false
    end
  end
end
