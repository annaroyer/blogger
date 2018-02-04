require 'rails_helper'

describe 'As a user' do
  context 'when I visit tag index' do
    it 'I can see a list of all tags' do
      article_1 = Article.create!(title: 'article 1', body: 'a lot of important things')
      article_2 = Article.create!(title: 'article 2', body: 'just stuff')
      article_3 = Article.create!(title: 'article 3', body: 'some other random stuff')
      tags = [ article_1.tags.create!(name: 'news'),
               article_1.tags.create!(name: 'politics'),
               article_2.tags.create!(name: 'nature'),
               article_2.tags.create!(name: 'animals'),
               article_3.tags.create!(name: 'food')
             ]

      visit articles_path
      click_link 'tags'

      expect(current_path).to eq(tags_path)
      tags.each do |tag|
        expect(page).to have_content(tag.name)
      end
    end
  end
end
