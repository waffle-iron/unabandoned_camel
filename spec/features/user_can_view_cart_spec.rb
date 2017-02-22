require 'rails_helper'

RSpec.feature "When a user visits the cart index page" do
  xit "user can see items that have been added to cart" do
    bean = Bean.create(title:"coffee", description:"good", price:1, image:"123")

    visit beans_path

    within(".row div:nth-child(1)") do
      click_button "Add Item"
    end
    
    visit cart_index_path

    #expect()
  end
  end