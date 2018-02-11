require 'rails_helper'

describe "user can see all vehicles" do
  context "user links to index page" do
    scenario "user can see all of their cars" do
      vehicle_1 = Vehicle.create!(make: "Chevy", model: "Bolt", year: 2017, mpg: 45, fuel: "electric")
      vehicle_2 = Vehicle.create!(make: "Chevy", model: "Bolt", year: 2017, mpg: 45, fuel: "electric")

      visit vehicles_path

      expect(page).to have_content(vehicle_1.make)
      expect(page).to have_content(vehicle_1.fuel)
      expect(page).to have_content(vehicle_2.make)
      expect(page).to have_content(vehicle_2.fuel)
    end
  end
end
