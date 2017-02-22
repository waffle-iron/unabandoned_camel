require 'rails_helper'

feature 'user visits category show page' do
  scenario 'user sees all items for category' do
    category = Category.create(name:'coffee')
    category.beans.create(title: "Ethiopian Wazzala",
                       description: "Light roasted Yirgacheffe",
                       price: 17,
                       image: "wazzala.jpg")
    category.beans.create(title: "Columbian Wazzala",
                       description: "Medium roasted Yirgacheffe",
                       price: 17,
                       image: "coffee.jpg")

    visit category_path(category)

    expect(current_path).to eq ('/coffee')
  end
end
