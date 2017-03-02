require 'rails_helper'

describe "when guest visits cart index page" do
  describe "guest increases quantity of item" do
    it "updates to new quantity and total price" do
      bean = Bean.create(title:"light roast", description:"good", price:1, image:"123")

      visit beans_path

      click_button "Add Item"
      click_button "Add Item"

      visit cart_index_path

        expect(page).to have_content("2")

      fill_in "update", with: 4
      click_on "Update Cart"

      expect(current_path).to eq(cart_index_path)

      within all(".caption").first do
        expect(page).to have_content("4")
      end

      within("#total") do
        expect(page).to have_content(4)
      end
    end
  end

  describe "guest decreases quantity of item" do
    it "updates to new quantity" do
      bean = Bean.create(title:"light roast", description:"good", price:1, image:"123")

      visit beans_path

      click_button "Add Item"
      click_button "Add Item"

      visit cart_index_path

      within all(".caption").first do
        expect(page).to have_content("2")
      end

      fill_in "update", with: 1
      click_on "Update Cart"

      expect(current_path).to eq(cart_index_path)

      within all(".caption").first do
        expect(page).to have_content("1")
      end

      within("#total") do
        expect(page).to have_content(1)
      end
    end
  end
end
