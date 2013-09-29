module AuthenticationHelper
  def sign_in_as(user)
    # save_and_open_page
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    expect(page).not_to have_content "Not found"
  end
end
