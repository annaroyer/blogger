require 'rails_helper'

describe 'As a user' do
  context 'when I visit /articles' do
    it 'I can see all articles' do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2s", body: "Body 2s")

      visit '/articles'

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to have_content(article_2.title)
      expect(page).to have_content(article_2.body)
    end
  end
end
