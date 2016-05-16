class SkipperSkill < ActiveRecord::Base
  belongs_to :skipper
  belongs_to :skill

  has_many :votes, as: :voteable
end
