class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :skipper

  validates :skipper, :voteable, presence: true
  validates :skipper, uniqueness: {scope: [:voteable_id, :voteable_type], message: "has already voted on this"}

  def self.create_or_update_to_upvote(options)
    vote = Vote.find_by(options)
    if vote
      if vote.value < 0
        vote.update(value: 0)
      else
        vote.update(value: 1)
      end
    else
      Vote.create(options.merge(value: 1))
    end
  end

  def self.create_or_update_to_downvote(options)
    vote = Vote.find_by(options)
    if vote
      if vote.value > 0
        vote.update(value: 0)
      else
        vote.update(value: -1)
      end
    else
      Vote.create(options.merge(value: -1))
    end
  end
end
