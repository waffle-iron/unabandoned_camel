require 'rails_helper'

feature "Guest visits item index" do
  scenario "guest can see all items" do
    item1 = Bean.create(title: "Ethiopian Sidama", description: "Good coffee", price: 14, image: "test_image")
    item2 = Bean.create(title: "Kenyan Thimu", description: "Great coffee", price: 15, image: "test_image_2")

    visit beans_path

      within all('.caption').first do
      expect(page).to have_content("Ethiopian Sidama")
      expect(page).to have_content("Good coffee")
      expect(page).to have_content(14)


    end

     within all('.caption').last do
      expect(page).to have_content("Kenyan Thimu")
      expect(page).to have_content("Great coffee")
      expect(page).to have_content(15)

    end

    expect(Bean.count).to eq(2)

  end
end
