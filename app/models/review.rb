class Review < ActiveRecord::Base
  belongs_to :movie,
    inverse_of: :reviews
  validates_presence_of :body
  validates_presence_of :rating
  validates_length_of :body, :minimum => 3
  validates_numericality_of :rating

  def self.ratings
    (1..5).to_a
  end

end
