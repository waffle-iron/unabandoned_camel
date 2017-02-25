require 'rails_helper'

describe "authenticated user tries to access admin screen" do
  scenario "user sees 404 error" do
    user = User.create(email:"Serrano@gmail.com", password:"pass", role: 0)  
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content("404")
  end
end
