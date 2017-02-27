require 'rails_helper'

describe 'user creates account' do
  context 'they visit the new_user_path and enter required fields' do
    scenario 'they are redirected to the links index page' do
      visit signup_path

      fill_in "Email", with: "o@bama.com"
      fill_in "Password", with: "michelle"
      fill_in "Password Confirmation", with: "michelle"

      click_on "Submit"

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Successfully created account!")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end
end
