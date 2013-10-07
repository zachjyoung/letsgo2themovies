class Movie < ActiveRecord::Base
  mount_uploader :image, ImageUploader 
  has_many :reviews,
    inverse_of: :movie


  validates_presence_of :title
  validates_presence_of :year
  validates_presence_of :description
  validates_presence_of :director
  validates_presence_of :cast

  validates_numericality_of :year
  validates_length_of :description, :minimum => 6
  validates_presence_of :state

  state_machine initial: :draft do
    event :submit do
      transition :draft => :submitted
    end
  end 
  
  

end
