require 'rails_helper'

describe User, type: :model do
  describe "relationships" do
    it {is_expected.to have_many(:stations).through(:favorites)}
  end

  describe "roles" do
    it "can be created as an admin" do
      admin_user = User.create(username: "ellen", password: "123", role: 1)

      expect(admin_user.role).to eq("admin")
      expect(admin_user.admin?).to be_truthy
    end

    it "can be created as a default user" do
      regular_user = User.create(username: "bob", password: "123")

      expect(regular_user.role).to eq("default")
      expect(regular_user.default?).to be_truthy
    end
  end

  describe "validates" do
    it "prescence of username" do
    user = User.new(password: "123")

    expect(user).to_not be_valid
    end

    it "prescence of password" do
      user = User.new(username: "doug")

      expect(user).to_not be_valid
    end

    it "uniqueness of username" do
      original = User.create!(username: "doug", password: "lol")
      copy_cat = User.new(username: "doug", password: "123")

      expect(copy_cat).to_not be_valid
    end
  end
end
