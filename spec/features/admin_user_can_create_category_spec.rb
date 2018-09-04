require 'rails_helper'

describe 'admin user can create a category' do
  describe 'they visit the category index page' do
    describe 'they click on Create Category and fill in the form' do
      it 'shows the new category on the index page' do

        admin = User.create(username: "Jesse", password: "Password", role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_categories_path

        click_on "Create Category"
        expect(current_path).to eq(new_admin_category_path)

        fill_in "category[title]", with: "New Category"
        click_on "Create Category"

        expect(current_path).to eq(admin_categories_path)
        expect(page).to have_content("New Category")
      end
    end
  end
end
