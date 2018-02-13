require 'rails_helper'

describe "user can delete a vehicle" do
  context "user clicks delete from index page" do
    scenario "user does not see deleted car on index page" do
      user = User.create(username: "dogzlover", password: "123")
      vehicle = Vehicle.create!(make: "Chevy", model: "Bolt", year: 2017, mpg: 45, fuel: "electric", user_id: user.id)

      visit '/'
      click_on "Sign In"
      fill_in("Username", with: "dogzlover")
      fill_in("Password", with: "123")
      click_on("Login")

      visit vehicles_path
      within(".button-container") do
        click_link("Delete")
      end

      expect(current_path).to eq(vehicles_path)
      expect(page).to_not have_content("electric")
    end
  end
end
