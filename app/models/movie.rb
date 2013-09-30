class Movie < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :year
  validates_presence_of :description
  validates_presence_of :director
  validates_presence_of :cast

  validates_numericality_of :year
  validates_length_of :description, :minimum => 6 

end
