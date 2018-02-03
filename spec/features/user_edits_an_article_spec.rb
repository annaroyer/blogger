require 'rails_helper'

describe 'As a user' do
  context 'when I click edit from an article show page' do
    it 'I can see an edit form prepopulated with the article information' do
      article = Article.create!(title: 'title', body: 'body')

      visit article_path(article)
      click_on 'Edit'

      expect(current_path).to eq(edit_article_path(article))
      expect(page).to have_field('Title', with: article.title)
      expect(page).to have_field('Body', with: article.body)
    end

    context 'and I edit the title and body' do
      it 'I can see the edited article information' do
        article = Article.create!(title: 'title', body: 'body')

        visit article_path(article)
        click_on 'Edit'
        fill_in('article[title]', with: 'better title')
        fill_in('article[body]', with: 'better body')
        click_on 'Update Article'

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content('better title')
        expect(page).to have_content('better body')
      end
    end
  end
end
