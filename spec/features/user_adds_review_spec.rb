require 'spec_helper'

feature 'User adds review to individual movie page', %Q{
  As a user
  I want to rate and review movies
  So that my voice is heard

}do
#   Acceptance Criteria:

# * User is signed in 
# * User is given an option to write a review for a movie on its page 
# * User is given an option select nth stars out of 5 stars
  let(:user) {FactoryGirl.create(:user)}
  let(:movie) {FactoryGirl.create(:movie)}

  scenario 'user adds valid review' do
    sign_in_as(user)
    visit movie_path(movie.id)
    click_on "Add Review"
    fill_in 'Review', with: "The Happening was the biggest piece of shit movie of all time"
    select(2, :from =>  'Rating')
    click_on 'Submit Review'
    expect(page).to have_content "The Happening was the biggest piece of shit movie of all time"

    new_review = Review.last
    expect(new_review.user_id).to eql(user.id)
  end

  scenario 'user adds invaid review' do
    sign_in_as(user)
    visit movie_path(movie.id)
    click_on "Add Review"
    click_on 'Submit Review'
    expect(page).to have_content("can't be blank")
  end
end
