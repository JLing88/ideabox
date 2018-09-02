require 'rails_helper'

describe 'user can edit an idea' do
  describe 'they visit the show page' do
    describe 'they fill in the form' do
      it 'shows the updated idea' do
        idea_1 = Idea.create!(title: "Idea 1 Title", body: "Idea 1 Body")
        # idea_2 = Idea.create!(title: "Idea 2 Title", body: "Idea 2 Body")

        visit ideas_path

        within("#idea-#{idea_1.id}") do
          click_on "Edit"
        end

        expect(current_path).to eq(edit_idea_path(idea_1))

        fill_in "idea[title]", with: "New Title"
        fill_in "idea[body]", with: "New Body"
        click_on "Update Idea"

        expect(current_path).to eq(idea_path(idea_1.id))
        expect(page).to have_content("New Title")
        expect(page).to have_content("New Body")

      end
    end
  end
end
