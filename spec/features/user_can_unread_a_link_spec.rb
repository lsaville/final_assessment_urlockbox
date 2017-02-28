require 'rails_helper'

describe 'user can unread a link', :js => true do
  context 'with a link thats been read' do
    it 'changes the link read to false' do
      bama = user
      log_in(bama)
      bama.links.create(title: 'cat vids', url: 'https://www.youtube.com/watch?v=tntOCGkgt98', read: true)
      link = bama.links.first

      visit '/'

      within('#links-list') do
        click_on "Mark as Unread"
      end

      within('#links-list') do
        expect(page).to have_text("false")
      end
    end
  end
end
