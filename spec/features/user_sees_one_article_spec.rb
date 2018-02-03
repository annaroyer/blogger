require 'rails_helper'

describe "As a user" do
  context "when I visit show articles" do
    it "I can see the information for one article" do
      article = Article.create!(title: 'weather report', description: 'bright and sunny')

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
