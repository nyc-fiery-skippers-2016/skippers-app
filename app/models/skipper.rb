class Skipper < ActiveRecord::Base
  has_many :skipper_skills
  has_many :skills, through: :skipper_skills
end
