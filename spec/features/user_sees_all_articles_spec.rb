require 'rails_helper'

describe 'As a user' do
  context 'when I visit /articles' do
    it 'I can see all articles' do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2s", body: "Body 2s")

      visit '/articles'

      expect(page).to have_link(article_1.title)
      expect(page).to have_link(article_2.title)
    end

    it 'I can see a create new article link' do
      visit '/articles'

      expect(page).to have_link('Create a New Article')
    end
  end
end
