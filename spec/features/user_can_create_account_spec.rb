require 'rails_helper'

describe 'user creates account' do
  context 'they visit the signup_path and enter required fields' do
    scenario 'they are redirected to the links index page' do
      visit signup_path

      fill_in "user_email", with: "o@bama.com"
      fill_in "user_password", with: "michelle"
      fill_in "user_password_confirmation", with: "michelle"

      click_on "Submit"

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Successfully created account!")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end

  context 'they visit the signup path and neglect to enter fields' do
    scenario "they see the signup path again with messages explaining what they've missed" do
      visit signup_path

      click_on "Submit"

      expect(current_path).to eq("/users")
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
      expect(page).to_not have_content("Logout")
      expect(page).to have_content("Login")
    end
  end
end
