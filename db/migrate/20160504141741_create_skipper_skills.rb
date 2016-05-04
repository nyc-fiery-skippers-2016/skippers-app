class CreateSkipperSkills < ActiveRecord::Migration
  def change
    create_table :skipper_skills do |t|
      t.references :skipper, foreign_key: true, index: true
      t.references :skill, foreign_key: true, index: true
    end
  end
end
