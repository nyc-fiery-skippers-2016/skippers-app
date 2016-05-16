class Skill < ActiveRecord::Base
  has_many :skipper_skills
  has_many :skippers, through: :skipper_skills
  has_many :images, as: :imageable
  # # longhand polymorphic has many
  # def images
  #   Image.where(imageable_id: self.id, imageable_type: "Skill")
  # end

  has_many :votes, as: :voteable

  def self.build_from_string(string)
    string.split(",").map { |skill_name| Skill.where(name: skill_name.strip).first_or_create }
  end

  def self.by_vote_score
    # all.sort_by(&:net_vote_score).reverse
    joins(:votes).group(:id).order('sum(votes.value) desc')
  end

  def net_vote_score
    votes.sum(:value)
  end
end
