require 'rails_helper'

describe 'As a user' do
  context 'when I click link to create a new article from articles index' do
    context 'and I fill in a title and body' do
      it 'then I can see the article I created' do
        visit articles_path

        click_link "Create a New Article"

        expect(current_path).to eq(new_article_path)

        save_and_open_page

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]", with: "New Body!"
        click_on "Create Article"

        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
        expect(page).to have_content("Article 'New Title!' was created")
      end
    end
  end
end
