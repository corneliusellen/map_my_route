require 'rails_helper'

describe "user can search for fuel stations in a location and fuel type" do
  describe "user links from user welcome page and enters zip and fuel type " do
    it "user sees list of stations" do
      station = Station.create(fuel_type: "ELEC",
                              name: "2785 Speer Apartments",
                              street: "2785 Speer Blvd.",
                              city: "Denver",
                              state: "CO",
                              zip: 80211,
                              hours_operation: "24/7")
      user = User.create(username: "Ellen", password: "123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
      click_on("Add Station")

      expect(current_path).to eq(new_search_path)

      fill_in("zip", with: "80211")
      select("Electric", from: :type)
      click_on("Find Fuel Stations")

      expect(page).to have_content("2785 Speer Apartments")
      expect(current_path).to eq(searches_path)

      click_on("Favorite Station")

      expect(page).to have_content("Station was favorited!")
      expect(current_path).to eq(favorites_path)
      expect(page).to have_content("2785 Speer Apartments")
    end
  end
end
