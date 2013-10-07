feature "A movie review is a draft waiting to be submitted", %Q{
  As a user
  I want to be able to verify movies submitted by other users
  So that the accuracy of the movie information is verified


} do
#   Acceptance Criteria:
# * When a user adds a movie for review, it is not immediately displayed on the main part of the site
# * A list of pending movies is available
# * The original user cannot approve his own movie submission
# * Once a second user has approved the movie it is displayed on the main part of the site

let(:user) {FactoryGirl.create(:user)} 
let(:movie) {FactoryGirl.create(:movie)}

  scenario "movie is in a draft state in a first submission" do
    sign_in_as(user)
    visit new_movie_path
    fill_in 'Title', with: "Fake" 
    fill_in 'Year', with: 2004
    fill_in 'Description', with: "fahaflsfhlafhl"
    fill_in 'Director', with: "John Doe"
    fill_in 'Cast', with: "Jane Danger, Bill Awesome, George Clooney"
    # save_and_open_page
    click_on "Create Movie Draft"
    new_movie = Movie.last
    visit movie_path(new_movie)

    expect(page).to have_content("Your draft is waiting for approval")
    expect(new_movie.state).to eql("draft")

  end
  
end
