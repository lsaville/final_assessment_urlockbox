require 'rails_helper'

describe 'user logs in' do
  context 'with valid credentials' do
    scenario 'they are redirected with a success message' do
      user = User.create(email: 'o@bama.com', password: 'michelle')
      visit '/'

      fill_in "email", with: 'o@bama.com'
      fill_in 'password', with: 'michelle'
      click_on 'Submit'

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Successfully logged in!")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end
end
