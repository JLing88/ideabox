require 'rails_helper'

describe 'admin user can delete a category' do
  describe 'they visit the index page' do
    describe 'they click on delete' do
      it 'should show the index page with that category deleted' do
        category_1 = Category.create!(title: "ruby")
        category_2 = Category.create!(title: "programming")

        visit categories_path

        within("#category-#{category_1.id}") do
          click_on "Delete"
        end

        expect(current_path).to eq(categories_path)
        expect(page).to have_content(category_2.title)
        expect(page).to_not have_content(category_1.title)
      end
    end
  end
end
