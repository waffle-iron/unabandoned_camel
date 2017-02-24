require 'rails_helper'

describe "user visits item show page" do
  describe "user sees item retired" do
    it "they see 'Item Retired' link" do
      item = Bean.create(title:"Dark Roast", description:"5 stars", price:"5", image:"Retired")
      user = User.create(name:"Jonathan", email:"Jonathan@gmail.com", password:"pass")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit bean_path(bean)

      expect(page).to have_content("Dark Roast")
      expect(page).to have_content("5 stars")
      expect(page).to have_content("5")
      
      expect(page).to have_content("Item Retired")
    end
  end