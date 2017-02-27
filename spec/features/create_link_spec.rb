require "rails_helper"

RSpec.describe "can create links", :js => :true do
  let(:login) {
    user = User.create(email: 'o@bama.com', password: 'michelle')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  }

  context "valid url" do
    scenario "Create a new link" do
      login
      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "http://turing.io"
      click_on "Add Link"

      within('#links-list') do
        expect(page).to have_text("Turing")
        expect(page).to have_text("http://turing.io")
      end
    end

    it 'is created with a default read value of false' do
      login
      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "http://turing.io"
      click_on "Add Link"

      within('#links-list') do
        expect(page).to have_text("Turing")
        expect(page).to have_text("http://turing.io")
        expect(page).to have_text("false")
      end
    end

  end

  context 'invalid url' do
    scenario 'user sees an error message' do
      login
      visit "/"
      fill_in "Title:", :with => "turing"
      fill_in "URL:", :with => "turing.io"
      click_on "Add Link"

      expect(page).to have_content("Url is not a valid URL")

      within('#links-list') do
        expect(page).to_not have_text("Turing")
        expect(page).to_not have_text("http://turing.io")
      end
    end
  end
end
