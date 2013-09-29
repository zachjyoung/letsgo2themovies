require 'spec_helper'

feature "user adds movies", %Q{
As a user 
I want to add a movie
So that others can review it

} do 
# * Acceptance Criteria 
# * User is signed in 
# * User is given the option to add a movie to be reviewed 
# * User is given the option to upload a picture 
let(:user) {FactoryGirl.create(:user)}
  
  scenario 'user adds a valid movie' do
    sign_in_as(user)
    visit new_movie_path
    fill_in 'Title', with: "Fake" 
    fill_in 'Year', with: 2004
    fill_in 'Description', with: "fahaflsfhlafhl"
    fill_in 'Director', with: "John Doe"
    fill_in 'Cast', with: "Jane Danger, Bill Awesome, George Clooney"
    click_on "Create Movie"

    new_movie = Movie.last
    expect(page).to have_content("John Doe")
    expect(new_movie.director).to include("John Doe")
    
  end

  scenario 'user cannot add movie when signed in' do
      visit new_movie_path
      expect(page).to have_content("You must be signed in before adding a movie.")
  end
end
