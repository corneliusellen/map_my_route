require 'rails_helper'

describe "As an admin" do
  describe "when I search for stations" do
    it "I can save stations and view them in my stations index" do
      admin = User.create(username: "ellen", password: "123", role: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_user_path(admin)
      click_on("Add Stations")

      expect(current_path).to eq(new_admin_search_path)
      fill_in("zip", with: "80209")
      select("Electric", from: :type)
      click_on("Find Fuel Stations")

      expect(current_path).to eq(admin_searches_path)
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

    visit admin_user_path(admin)
    click_on("Add Stations")
    fill_in("zip", with: "80209")
    select("Electric", from: :type)
    click_on("Find Fuel Stations")
    click_on("Save Station")
    click_on("Delete Station")

    expect(current_path).to eq(admin_stations_path)
    expect(page).to_not have_content("KEW REALTY")
    expect(Station.all.count).to eq(0)
  end
end

describe "As a default user" do
  it "I view admin welcome page" do
    user = User.create(username: "ellen", password: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_user_path(user)

    expect(page).to have_content("The page you were looking for doesn't exist.")
    expect(page).to_not have_content("Add Station")
  end

  it "I cannot view admin search path" do
    user = User.create(username: "ellen", password: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_search_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
    expect(page).to_not have_content("Find Fuel Stations")
  end

  it "I cannot save or delete stations" do
    user = User.create(username: "ellen", password: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_stations_path

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
