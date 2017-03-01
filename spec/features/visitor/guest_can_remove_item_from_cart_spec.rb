require 'rails_helper'

describe ' when guest visits cart index page' do
  it "user can remove item from cart" do
    bean = Bean.create(title:"Dark Roast", description:"good", price:1, image:"123")
    visit beans_path
    click_button "Add Item"

    visit cart_index_path

    click_link "Remove"

    expect(current_path).to eq("/cart")

    expect(page).to_not have_content("good")
    expect(page).to_not have_content("1")


    within(".alert-danger") do
      expect(page).to have_content("Successfully removed Dark Roast from your cart.")
      click_link "Dark Roast"
    end

    expect(current_path).to eq(bean_path(bean))
  end
end
