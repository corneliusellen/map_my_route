require 'rails_helper'

describe "As an admin" do
  describe "when I search for stations" do
    it "I can save stations and see them in my stations index" do
      admin = User.create(username: "ellen", password: "123", role: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit user_path(admin)
      click_on("Add Station")

      expect(current_path).to eq(new_search_path)
      fill_in("zip", with: "80209")
      fill_in("type", with: "ELEC")
      click_on("Find Fuel Stations")

      expect(current_path).to eq(searches_path)
      expect(page).to have_content("KEW REALTY")

      click_on("Save Station")

      expect(current_path).to eq(admin_stations_path)
      expect(Station.all.count).to eq(1)
      expect(page).to have_content("Station was saved!")
    end
  end

  it "I can delete stations" do
    admin = User.create(username: "ellen", password: "123", role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit user_path(admin)
    click_on("Add Station")
    fill_in("zip", with: "80209")
    fill_in("type", with: "ELEC")
    click_on("Find Fuel Stations")
    click_on("Save Station")
    click_on("Delete Station")

    expect(current_path).to eq(admin_stations_path)
    expect(page).to_not have_content("KEW REALTY")
    expect(Station.all.count).to eq(0)
  end
end
