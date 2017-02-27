require 'rails_helper'

describe 'user logs out' do
  context 'they are logged in a click logout' do
    scenario 'they are redirected to a page where' do
      user = User.create(email: 'o@bama.com', password: 'michelle')

      visit login_path

      fill_in "email", with: user.email
      fill_in "password", with: 'michelle'
      click_on "Submit"

      click_on "Logout"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Successfully logged out!")
      expect(page).to have_content("Login")
    end
  end
end
