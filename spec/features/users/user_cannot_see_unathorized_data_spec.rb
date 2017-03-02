require 'rails_helper'

describe "user tries to access another user's show page" do
  it "user cannot access other user's show page" do
    user1 = User.create(email:"Serrano@gmail.com", password:"pass")  

   visit dashboard_path

   expect(page).to have_content("404")
  end
end
