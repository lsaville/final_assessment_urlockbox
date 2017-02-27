require 'rails_helper'

describe 'user logs in' do
  let (:user) { User.create(email: 'o@bama.com', password: 'michelle')}

  context 'with valid credentials' do
    scenario 'they are redirected with a success message' do
      visit '/'

      fill_in "email", with: user.email
      fill_in 'password', with: 'michelle'
      click_on 'Submit'

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Successfully logged in!")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end

  context 'with invalid credentials' do
    scenario 'missing password they see the login again with an unsuccessful message' do
      visit '/'

      fill_in 'email', with: user.email
      click_on 'Submit'

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Something went wrong!")
    end
  end
end
