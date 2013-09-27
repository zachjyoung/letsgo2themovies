require 'spec_helper'

feature 'upload photo', %Q{
  As a user 
  I want to upload a photo
  So people can stalk me to my home
}do 

  #Acceptance Criteria 
  # I am prompted for a photo 
  # I can upload my photo from a file on my hard drive 
  # Once the photo is uploaded, I can see a preview of the profile pic

let (:user) { FactoryGirl.build(:user) }

  scenario 'after I create an account, I can upload a photo' do
    login_user(user)
    attach_file('photo_attachment', 'spec/features/images/stupid.jpeg')
    click_button 'Submit you photo'
  end
end
