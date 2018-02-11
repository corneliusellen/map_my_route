require 'rails_helper'

describe "user can see a vehicle" do
  context "user links from index page" do
    scenario "user sees all vehicle information" do
      vehicle = Vehicle.create!(make: "Chevy", model: "Bolt", year: 2017, mpg: 45, fuel: "electric")

      visit vehicles_path
      click_link vehicle.id

      expect(current_path).to eq(vehicle_path(vehicle))
    end
  end
end
