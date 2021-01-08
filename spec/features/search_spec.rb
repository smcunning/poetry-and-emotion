require 'rails_helper'

describe 'As a user' do
  describe 'when I visit root path and fill in Emily in the text field and submit' do
    before :each do
      visit '/'
      fill_in :author, with: "Emily"
      click_on "Get Poems"
    end

    it 'takes me to the search page and I see a list of the first 10 poems' do
      expect(current_path).to eq('/search')
      expect(page).to have_css(".poem", count: 10)
    end

    it 'shows the title, author and the poem (as a single string) for each poem' do
      within(first(".poem")) do
        expect(page).to have_css(".title")
        expect(page).to have_css(".author")
        expect(page).to have_css(".poem-text")
      end
    end

    it 'shows the tone or tones for each poem' do
      within(first(".poem")) do
        expect(page).to have_css(".tones")
      end
    end
  end
end
