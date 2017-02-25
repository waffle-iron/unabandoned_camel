require 'rails_helper'

describe "As an unauthorized user" do
  describe "When unauthorized user tries to checkout" do
    it "user is redirected to login/create account page" do
      user1 = User.create(email:"Serrano@gmail.com", password:"pass")
      bean = Bean.create(title:"coffee", description:"good", price:1, image:"123")

      visit beans_path
      click_button "Add Item"

      visit cart_index_path

      expect(page).to have_button("Login or Register to Checkout")
    end
  end

  describe "user tries to access admin screen" do
    scenario "user sees 404 error" do
      user = User.create(email:"Serrano@gmail.com", password:"pass")
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_dashboard_path

      expect(page).to have_content("404")
    end
  end
end
