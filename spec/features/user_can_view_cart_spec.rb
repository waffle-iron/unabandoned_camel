require 'rails_helper'

RSpec.feature "When a user visits the cart index page" do
  it "user can see items that have been added to cart" do
    bean = Bean.create(title:"Arabica", description:"good", price:1, image:"123")

    visit beans_path

    within all(".thumbnail").first do
      click_button "Add Item"
    end

      click_link "Cart"

      expect(current_path).to eq('/cart')
      expect(page).to have_content("Arabica")
      expect(page).to have_content("good")
      #Need to image test
      within("#total") do
        expect(page).to have_content(1)
      end
    end
  end
