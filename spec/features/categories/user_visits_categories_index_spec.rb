require 'rails_helper'

feature 'guest visits category index' do
  scenario 'guest sees display of all categories' do
    category1 = Category.create(name: 'dark roast')
    category2 = Category.create(name: 'light roast')

    visit categories_path

    within('h2') do
      expect(page).to have_content('Coffee Categories')
    end

    within all('h3').first do
      expect(page).to have_content("dark roast")
    end

    within all('h3').last do
      expect(page).to have_content("light roast")
    end
  end

  scenario 'guest clicks button to navtigate to category page' do
    category1 = Category.create(name: 'dark roast')

    visit categories_path

    click_button 'Shop Now'

    expect(current_path).to eq('/dark-roast')

  end
end
