require 'rails_helper'

describe 'admin user can create a category' do
  describe 'they visit the category index page' do
    describe 'they click on Create Category and fill in the form' do
      it 'shows the new category on the index page' do
        category_1 = Category.create!(title: "ruby")
        category_2 = Category.create!(title: "programming")

        visit categories_path

        click_on "Create Category"
        expect(current_path).to eq(new_category_path)

        fill_in "category[title]", with: "New Category"
        click_on "Create Category"

        expect(current_path).to eq(categories_path)
        expect(page).to have_content("New Category")
      end
    end
  end
end
