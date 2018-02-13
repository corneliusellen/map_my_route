require 'rails_helper'

describe "user can create new vehicle" do
  describe "user links from root page" do
    context "user fills in car info and clicks submit" do
      scenario "user sees index page with new vehicle" do
        user = User.create(username: "dogzlover", password: "123")
        visit '/'
        click_on "Sign In"
        fill_in("Username", with: "dogzlover")
        fill_in("Password", with: "123")
        click_on("Login")

        visit new_vehicle_path

        fill_in('Make', with: 'Chevy')
        fill_in('Model', with: 'Bolt')
        fill_in('Year', with: 2017)
        fill_in('Mpg', with: 45)
        fill_in('Fuel', with: 'electric')
        click_button('Create')

        expect(current_path).to eq(vehicles_path)
        expect(page).to have_content("Chevy")
        expect(page).to have_content("electric")
        expect(Vehicle.all.count).to eq(1)
      end
    end
  end
end
