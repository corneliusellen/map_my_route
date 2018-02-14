require 'rails_helper'

describe "user can search for fuel stations in a location" do
  describe "user links from user welcome page" do
    it "user enters city and fuel type and sees list of nearby stations" do
      station = Station.create(fuel_type: "ELEC", name: "2785 Speer Apartments", street: "2785 Speer Blvd.", city: "Denver", state: "CO", zip: 80211, hours_operation: "24/7")
      user = User.create(username: "Ellen", password: "123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
      click_on("Add Station")

      expect(current_path).to eq(stations_path)
      expect(page).to have_content("2785 Speer Apartments")

      click_on("Favorite Station")

      expect(page).to have_content("Station was favorited!")
      expect(current_path).to eq(stations_path)
    end
  end
end
