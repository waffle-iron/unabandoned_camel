require 'rails_helper'

feature 'visitor check-out' do
  scenario 'visitor looks at their cart' do
    bean = Bean.create(title:"coffee", description:"good", price:1, image:"123")
    User.create(email: 'test@test.com', password: 'password')
    visit beans_path
    click_button "Add Item"
    visit ('/cart')

    within('#checkout') do
        expect(page).to have_button('Login or Register to Checkout')
    end

    visit login_path
    fill_in "session[email]", with: "test@test.com"
    fill_in "session[password]", with: "password"
    click_button 'Login'
    visit('/cart')

    expect { click_on "Checkout"}.to change(Order, :count).by(1)

    expect(current_path).to eq('/orders')
    expect(page).to have_content('Order was successfully placed')

    within('#order-table') do
      expect(page).to have_content('coffee')
      expect(page).to have_content('1')
    end

    within('#order_info') do
      expect(page).to have_content('1')
    end

  end
end
