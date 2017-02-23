require 'rails_helper'


describe "user creates new account" do
  scenario "user can see logged-in user dashboard" do

    visit login_path

    click_on "Create Account"

    fill_in "user[email]", with: "bob@aol.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"

    expect { click_on "Submit New Account"}.to change(User, :count).by(1)
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Logged in as #{User.last.email}")
    expect(page).to have_content("bob@aol.com")
    expect(page).to have_link("Logout")
    expect(page).not_to have_link("Login")
  end
end