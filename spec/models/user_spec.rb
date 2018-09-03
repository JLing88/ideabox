require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:username)}

    it 'uniqueness of username' do
      orig = User.create!(username: "User", password: "Password")
      duplicate = User.new(username: "User", password: "Password")

      expect(duplicate).to_not be_valid
    end
  end

  describe 'roles' do
    it 'can be created as an admin' do
      user = User.create(username: "Jesse", password: "Password", role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it 'can be created as a default user' do
      user = User.create(username: "Jesse", password: "Password", role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end
end
