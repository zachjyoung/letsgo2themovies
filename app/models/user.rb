class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImageUploader
<<<<<<< HEAD
  has_many :authentications
  has_many :reviews
=======
>>>>>>> parent of a62d534... github login works not twitter or facebook

end
