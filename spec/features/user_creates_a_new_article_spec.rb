require 'rails_helper'

describe 'As a user' do
  context 'when I click link to create a new article from articles index' do
    context 'and I fill in a title and body' do
      it 'then I can see the article I created' do
        visit articles_path

        click_link "Create a New Article"

        expect(current_path).to eq(new_article_path)

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]", with: "New Body!"
        fill_in "article[tag_list]", with: "ruby, technology"
        click_on "Create Article"

        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
        expect(page).to have_content("Article 'New Title!' was created")
        expect(page).to have_content("ruby technology")
      end
    end
  end
end
