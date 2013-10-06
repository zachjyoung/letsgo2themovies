require 'spec_helper'

feature 'User can login to their account', %Q{
  As a User
  I want to login to my account 
  So I can review movies and vote on things
}do 

let(:user) { FactoryGirl.create(:user) }

  scenario 'user logs into their account from the front page' do 
    visit '/'
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'user is a dummy and does not have the correct password' do 
    visit '/'
    click_on 'Sign in'
    click_button 'Sign in'
    expect(page).to have_content("Invalid email or password")
  end

  scenario 'user logs out of site' do 
    visit '/'
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully.')
    click_on 'Sign out'
    expect(page).to have_content('Signed out successfully.')
  end  
end
