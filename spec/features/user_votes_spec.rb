require 'spec_helper'

feature "User casts a vote", %Q{
  As a registered User
  I want to be able to upvote and downvote reviews on the site
  So that I can be all metacritical. 
}do
  
    # AC
    # Each review has the option to upvote and/or downvote
    # I can only upvote or downvote once per review
    # I can change my vote from upvote to downvote and vice versa. 

  let(:movie) { review.movie }
  let(:review) { FactoryGirl.create(:review) }
  let(:user) { review.user }

  scenario "user makes a valid upvote" do
    sign_in_as(user)
    visit movie_path(movie)

    within "#upvote" do
      click_on "+"
    end
      
    vote = Vote.last
    expect(vote.value).to eql(1)
    expect(review.total_score).to eql(1)
  end 

  scenario "user makes a valid downvote" do
    sign_in_as(user)
    visit movie_path(movie)

    within "#downvote" do
      click_on "-"
    end

    vote = Vote.last
    expect(vote.value).to eql(-1)
    expect(review.total_score).to eql(-1)
  end

  scenario "user can only make one vote" do
    sign_in_as(user)
    visit movie_path(movie)

    within "#downvote" do
      click_on "-"
    end

    within "#downvote" do
      click_on "-"
    end

    expect(review.total_score).to eql(-1) 
    expect(page).to have_content("You can only vote once in either direction.")   
  end
end

