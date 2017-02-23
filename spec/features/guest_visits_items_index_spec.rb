require 'rails_helper'

xfeature "Guest visits item index" do
  scenario "guest can see all items" do
    item = create(:bean)
    item1 = create(:bean)
    
    visit beans_path

    within(".row div:nth-child(1)") do
      expect(page).to have_content(item.title)
      #expect(page).to have_content(item.image)
      expect(page).to have_content(item.price)
      expect(page).to have_content(item.description)

    end

    within(".row div:nth-child(2)") do
      expect(page).to have_content(item1.title)
      #expect(page).to have_content(item1.image)
      expect(page).to have_content(item1.price)
      expect(page).to have_content(item1.description)
    end

    expect(Bean.count).to eq(2)

  end
end
