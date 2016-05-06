class Skill < ActiveRecord::Base
  has_many :skipper_skills
  has_many :skippers, through: :skipper_skills

  def self.build_from_string(string)
    string.split(",").map { |skill_name| Skill.where(name: skill_name.strip).first_or_create }
  end
end
