require 'rails_helper'

feature "Guest visits item index" do
  scenario "guest can see all items" do
    item = Bean.create(id: 1,
                       title:"Dark Roast",
                       description:"good",
                       price:1,
                       image:"123")
    item1 = Bean.create(id: 2,
                        title:"Light Roast",
                        description:"good",
                        price:1,
                        image:"123")

    visit beans_path

    within all(".thumbnail").first do
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.price)
      expect(page).to have_content(item.description)

    end

    within all(".thumbnail").last do
      expect(page).to have_content(item1.title)
      expect(page).to have_content(item1.price)
      expect(page).to have_content(item1.description)
    end

    expect(Bean.count).to eq(2)

  end
end
