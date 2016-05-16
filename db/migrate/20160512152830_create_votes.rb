class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id
      t.string :voteable_type
      t.references :skipper, foreign_key: true
      t.integer :value, default: 0
    end
    add_index :votes, [:voteable_id, :voteable_type, :skipper_id], :unique => true
  end
end
