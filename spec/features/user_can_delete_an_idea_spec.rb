require 'rails_helper'

describe 'user can delete an idea' do
  describe 'they visit /ideas' do
    describe 'they click delete on an idea' do
      it 'displays the index page without that idea' do
        category = Category.create!(title: "Category 1")
        idea_1 = category.ideas.create!(title: "Idea 1 Title", body: "Idea 1 Body")
        idea_2 = category.ideas.create!(title: "Idea 2 Title", body: "Idea 2 Body")

        visit ideas_path
        within("#idea-#{idea_1.id}") do
          click_on "Delete"
        end

        expect(current_path).to eq(ideas_path)
        expect(page).to have_content(idea_2.title)
        expect(page).to_not have_content(idea_1.title)
        expect(page).to have_content(idea_2.body)
        expect(page).to_not have_content(idea_1.body)
      end
    end
  end
end
