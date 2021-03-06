require 'rails_helper'

describe "user can see a vehicle" do
  context "user links from index page" do
    scenario "user sees all vehicle information" do
      user = User.create(username: "dogzlover", password: "123")
      vehicle = Vehicle.create!(make: "Chevy", model: "Bolt", year: 2017, mpg: 45, fuel: "electric", user_id: user.id)

      visit '/'
      click_on "Sign In"
      fill_in("Username", with: "dogzlover")
      fill_in("Password", with: "123")
      click_on("Login")

      visit vehicles_path
      click_link vehicle.id

      expect(current_path).to eq(vehicle_path(vehicle))
    end
  end
end
