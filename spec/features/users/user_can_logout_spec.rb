require 'rails_helper'

describe "when user clicks logout" do
  it "is logged out and sees welcome page" do
    user = User.create(username: "dogzlover", password: "123")
    visit '/'

    click_on "Sign In"
    fill_in("Username", with: "dogzlover")
    fill_in("Password", with: "123")
    click_on("Login")

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome #{user.username}!")

    click_on("Logout")

    expect(current_path).to eq(root_path)
  end
end
