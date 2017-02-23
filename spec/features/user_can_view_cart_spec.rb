require 'rails_helper'

RSpec.feature "When a user visits the cart index page" do
  it "user can see items that have been added to cart" do
    bean = Bean.create(title:"ryan", description:"good", price:1, image:"123")

    visit beans_path

    # within all(".col-sm-12").first do
      click_button "Add Item"
    # end
    
    #need to add button in navbar for cart
    visit cart_index_path
    #####

    expect(page).to have_content("ryan")
    expect(page).to have_content("good")
    #expect(page).to have_content("123")
    


    within(".total") do
    expect(page).to have_content(1)
    end




  end
  end