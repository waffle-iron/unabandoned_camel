require 'rails_helper'

describe "user tries to access another user's show page" do
  it "user cannot access other user's show page" do
    user1 = User.create(email:"Serrano@gmail.com", password:"pass")  
    #user = User.create(email:"Jonathan@gmail.com", password:"pass")
    #allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

   visit dashboard_path

   expect(page).to have_content("404")
  end
end

    


