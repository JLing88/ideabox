require 'rails_helper'

describe "As a registered user" do
  describe "I visit '/' " do
    describe "I click 'I already have an account'" do
      describe "I enter my login information and submit the form" do
        it 'should show a welcome message with my username' do
          user = User.create(username: "funbucket13", password: "test")

          visit '/'

          click_on "I already have an account"
          expect(current_path).to eq(login_path)
          fill_in "username", with: user.username
          fill_in "password", with: user.password

          click_on "Log In"

          expect(current_path).to eq(user_path(user))
          expect(page).to have_content("Welcome, #{user.username}!")
          expect(page).to have_content("Log out")
        end
      end
    end
  end
end
