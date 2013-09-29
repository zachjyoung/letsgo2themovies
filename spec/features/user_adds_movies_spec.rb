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
  
  scenario 'user adds a valid movie' do
    visit new_movie_path
    fill_in 'Title', with: "Fake" 
    fill_in 'Year', with: 2004
    fill_in 'Description', with: "fahaflsfhlafhl"
    fill_in 'Director', with: "John Doe"
    fill_in 'Cast', with: "Jane Danger, Bill Awesome, George Clooney"
    click_on "Create Movie"

    new_movie = Movie.last
    expect(page).to have_content("John Doe")
    expect(new_movie).to include("John Doe")
    
  end
end
