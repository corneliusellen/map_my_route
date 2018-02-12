require 'rails_helper'

describe "when a user logs in" do
  it "sees her information" do
    user = User.create(username: "dogzlover", password: "123")
    visit '/'

    click_on "Sign In"

    expect(current_path).to eq(login_path)

    fill_in("Username", with: "dogzlover")
    fill_in("Password", with: "123")
    click_on("Login")

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome #{user.username}!")
    expect(page).to have_content("Add Vehicle")
    expect(page).to have_content("Add Station")
    expect(page).to have_content("Create Route")
    expect(page).to have_content("Sign Out")
  end
end
