require 'rails_helper'

describe 'As a user' do
  context 'when I click tag link on article show page' do
    it 'I can see a tag' do
      article = Article.create!(title: 'great article', body: 'true facts')
      tag = article.tags.create!(name: 'news')

      visit article_path(article)
      click_link 'news'

      expect(page).to have_content(tag.name)
    end
  end
end
