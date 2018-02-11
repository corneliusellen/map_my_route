require 'rails_helper'

describe "user can delete a vehicle" do
  context "user clicks delete from index page" do
    scenario "user does not see deleted car on index page" do
      vehicle = Vehicle.create!(make: "Chevy", model: "Bolt", year: 2017, mpg: 45, fuel: "electric")

      visit vehicles_path
      within("##{vehicle.id}") do
        click_link("delete")
      end

      expect(current_path).to eq(vehicles_path)
      expect(page).to_not have_content("electric")
    end
  end
end
