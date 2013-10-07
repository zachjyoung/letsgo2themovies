class Vote < ActiveRecord::Base
  validates_numericality_of :value
  validate :valid_vote
  validates_uniqueness_of :user_id, scope: :voteable

  belongs_to :user
  belongs_to :voteable, polymorphic: true



  def valid_vote
    if value == 1 || value == -1 
      true
    else
      errors.add(:value, "Vote isn't 1 or -1.")
    end
  end

end
