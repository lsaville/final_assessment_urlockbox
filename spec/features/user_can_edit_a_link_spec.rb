require 'rails_helper'

describe 'user edits link', js: true do
  context 'they click a the edit button on a link' do
    scenario 'they are redirected to a page to edit the link' do
      bama = user
      log_in(bama)
      bama.links.create(title: 'cat vids', url: 'https://www.youtube.com/watch?v=tntOCGkgt98')
      link = bama.links.first

      visit '/'
      # page.save_screenshot('~/Desktop/blah1.png')

      within('#links-list') do
        click_on "Edit"
      end
# page.save_screenshot('~/Desktop/blah2.png')
      expect(current_path).to eq("/links/#{link.id}/edit")
    end
  end
end
