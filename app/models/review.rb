class Review < ActiveRecord::Base
  belongs_to :movie,
    inverse_of: :reviews
  belongs_to :user,
    inverse_of: :reviews 
  has_many :votes, as: :voteable

  validates_presence_of :body
  validates_presence_of :rating
  validates_length_of :body, :minimum => 3
  validates_numericality_of :rating
  validates_numericality_of :vote_count

  def self.ratings
    (1..5).to_a
  end

  def total_score
    votes.pluck(:value).reduce(:+)
  end
end
