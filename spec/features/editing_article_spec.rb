require "rails_helper"

RSpec.feature "Editing an Article" do

    before do
        @article = Article.create!(title: 'My first article', body: 'Lorem ipsum dolor sit')
    end
    
    scenario "A User updates an article" do

        visit "/"

        click_link @article.title
        click_link "Edit Article"

        fill_in "Title", with: "Updated Title"
        fill_in "Body", with: "Updated body article"
        click_button "Update Article"

        expect(page).to have_content("Article has been updated")
        expect(current_path).to eq(article_path(@article))
    end

    scenario "A User fails to update an article" do

        visit "/"

        click_link @article.title
        
        click_link "Edit Article"

        fill_in "Title", with: ""
        fill_in "Body", with: "Updated body article"
        click_button "Update Article"

        expect(page).to have_content("Article has not been updated")
        expect(current_path).to eq(article_path(@article))
    end

end