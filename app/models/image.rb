class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_many :votes, as: :voteable

  validates :url, presence: true
end
