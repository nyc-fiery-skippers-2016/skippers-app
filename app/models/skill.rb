class Skill < ActiveRecord::Base
  has_many :skipper_skills
  has_many :skippers, through: :skipper_skills
end
