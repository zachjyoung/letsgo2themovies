class Review < ActiveRecord::Base
  belongs_to :movie,
    inverse_of: :review
  validates_presence_of :body
  validates_presence_of :rating
  validates_length_of :body, :minimum => 3
  validates_numericality_of :rating

end
