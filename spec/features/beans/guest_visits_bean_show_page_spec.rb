require 'rails_helper'

  feature 'guest visits show page' do
    scenario 'guest sees bean information' do
      bean = Bean.create(id: 1,
                         title:"Dark Roast",
                         description:"good",
                         price:1,
                         image:"123")

      visit bean_path(bean)

      within('h2') do
        expect(page).to have_content(bean.title)
      end
      within all('p').first do
        expect(page).to have_content(bean.description)
      end
      within("#price") do
        expect(page).to have_content(bean.price)
      end
    end

    scenario 'guest can add item to cart' do
      bean = Bean.create(id: 1,
                         title:"Dark Roast",
                         description:"good",
                         price:1,
                         image:"123")

      visit bean_path(bean)

      click_button("Add Item")

      expect(page).to have_content("1 #{bean.title} added to cart")
    end
  end
