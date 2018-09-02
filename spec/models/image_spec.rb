require 'rails_helper'

describe Image, type: :model do
  describe 'validations' do
    it {should validate_presence_of :url}
  end
  describe 'relationships' do
    it {should have_many(:image_ideas)}
    it {should have_many(:ideas).through(:image_ideas)}
  end
end
