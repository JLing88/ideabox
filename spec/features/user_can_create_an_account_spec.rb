require 'rails_helper'

describe 'visitor can create a user account' do
  describe "they visit '/'" do
    describe "they click on 'Sign Up' and enter username and password" do
      it "should display a welcome page with the new user's name" do
        username = "test_user"
        visit '/'

        click_on "Sign Up"
        expect(current_path).to eq(new_user_path)

        fill_in :user_username, with: username
        fill_in :user_password, with: "test"

        click_on "Create User"

        expect(page).to have_content("Welcome, #{username}!")
      end
    end
  end
end
