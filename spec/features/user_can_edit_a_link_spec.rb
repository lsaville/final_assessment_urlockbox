require 'rails_helper'

describe 'user edits link', js: true do
  context 'they click a the edit button on a link' do
    scenario 'they are redirected to a page to edit the link' do
      bama = user
      log_in(bama)
      bama.links.create(title: 'cat vids', url: 'https://www.youtube.com/watch?v=tntOCGkgt98')
      link = bama.links.first

      visit '/'

      within('#links-list') do
        click_on "Edit"
      end

      expect(current_path).to eq("/links/#{link.id}/edit")
    end
  end

  context 'they edit the link and are redirected to the links path' do
    scenario 'they change the title' do
      bama = user
      log_in(bama)
      bama.links.create(title: 'cat vids', url: 'https://www.youtube.com/watch?v=tntOCGkgt98')
      link = bama.links.first

      visit "/links/#{link.id}/edit"

      fill_in "Title:", with: "extreme cat vids"
      click_on "Edit Link"

      sleep 1

      expect(current_path).to eq(links_path)
      within('#links-list') do
        expect(page).to have_text("extreme cat vids")
        expect(page).to have_text("https://www.youtube.com/watch?v=tntOCGkgt98")
      end
    end
  end
end
