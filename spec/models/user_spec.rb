require 'rails_helper'

describe User do
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
