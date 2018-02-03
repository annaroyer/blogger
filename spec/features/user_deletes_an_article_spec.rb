require 'rails_helper'

describe 'As a user' do
  context 'when I click delete from an article show page' do
    it 'then I can see all articles without the deleted article' do
      article_1 = Article.create!(title: 'New title!', body: 'New body!')
      article_2 = Article.create!(title: 'Another Title!', body: 'Another body!')

      visit article_path(article_1)
      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).to_not have_content(article_1.title)
    end
  end
end
