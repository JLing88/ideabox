require 'rails_helper'

describe 'user can create an idea' do
  describe 'As a User' do
    describe 'they visit /ideas' do
      describe "they click on 'Create' and fill in the form" do
        it 'displays the show page for that idea' do
          category = Category.create!(title: "Category 1")
          visit ideas_path

          click_link "Create New Idea"
          fill_in "idea[title]", with: "Idea 1 Title"
          fill_in "idea[body]", with: "Idea 1 Body"
          save_and_open_page
          select "#{category.title}", from: "Category"

          click_on "Create Idea"

          expect(page).to have_content("Idea 1 Title")
          expect(page).to have_content("Idea 1 Body")
        end
      end
    end
  end
end
