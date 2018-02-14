require 'rails_helper'

describe "user can search for fuel stations in a location" do
  describe "user links from user welcome page" do
    it "user enters city and fuel type and sees list of nearby stations" do
      user = User.create(username: "Ellen", password: "123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
      click_on("Add Station")

      expect(current_path).to eq(new_search_path)
      fill_in("zip", with: "80209")
      fill_in("type", with: "ELEC")
      click_on("Find Fuel Stations")

      expect(current_path).to eq(searches_path)
      expect(page).to have_content("KEW REALTY")

      click_on("Save Station")

      expect(current_path).to eq(stations_path)
      expect(Station.all.count).to eq(1)
      expect(page).to have_content("Station was saved!")
    end
  end
end
