require 'rails_helper'

describe "user can search for fuel stations in a location" do
  describe "user links from user welcome page" do
    it "user enters city and fuel type and sees list of nearby stations" do
      user = User.create(username: "Ellen", password: "123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
      click_on("Add Station")

      expect(current_path).to eq(new_search_path)
      fill_in("City", with: "Denver")
      fill_in("Fuel Type", with: "electric")
      click_on("submit")

      expect(current_path).to eq(search_path)
      expect(page).to have_content("Not sure yet")
    end
  end
end
