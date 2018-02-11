require 'rails_helper'

describe "user can edit a vehicle" do
  context "user links from vehicle index page" do
    scenario "user fills in new information, submits, and sees show page with updated information" do
      vehicle = Vehicle.create!(make: "Chevy", model: "Bolt", year: 2017, mpg: 45, fuel: "electric")

      visit vehicles_path
      click_on "Edit"
      expect(current_path).to eq(edit_vehicle_path(vehicle))

      fill_in("Model", with: "Volt")
      click_button('Update')

      expect(current_path).to eq(vehicle_path(vehicle))
      expect(page).to have_content("Volt")
      expect(page).to_not have_content("Bolt")
    end
  end
end
