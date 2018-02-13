require 'rails_helper'

describe "when user logs in" do
  it "sees her personal info" do
    visit '/'

    click_on "Create Account"
    expect(current_path).to eq(new_user_path)

    fill_in("user[username]", with: "dogzlover")
    fill_in("user[password]", with: "123password")
    click_on("Create Account")

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome dogzlover!")
    expect(page).to have_content("Add Vehicle")
    expect(page).to have_content("Add Station")
    expect(page).to have_content("Create Route")
    expect(page).to have_content("Logout")
  end
end
