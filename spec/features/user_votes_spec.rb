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
    save_and_open_page
    within "#user_#{user.id}" do
      find("#upvote").click
    end
    
    vote = Vote.last
    expect(vote).to exist
    expect(review.vote_count).to eql(1)
    # @vote_count = (Vote.where(:value = 1).count) + (Vote.where(:value = -1)) 
  end 
end

