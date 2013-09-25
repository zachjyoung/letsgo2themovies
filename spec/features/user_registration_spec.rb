require 'spec_helper'



feature 'User can register a account', %Q{
  As a User
  I want to register 
  So I can review movies
}do 

let(:user) { FactoryGirl.create(:user) }

scenario 'new user signs up from the front page with valid email' do 
  visit '/'
  click_on 'Sign up'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  fill_in 'Password confirmation', with: user.password
  expect(page).to have_content('Thanks for signing up!')
  end
end

