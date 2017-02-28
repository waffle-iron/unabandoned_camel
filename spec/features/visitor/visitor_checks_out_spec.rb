require 'rails_helper'

feature 'visitor check-out' do
  scenario 'visitor looks at their cart' do
    bean = Bean.create(title:"coffee", description:"good", price:1, image:"123")
    User.create(email: 'test@test.com',
                password: 'password',
                password_confirmation: 'password',
                first_name: 'First Test',
                last_name: 'Last Test',
                street: '123 Test St',
                city: 'Test City',
                state: 'Test State',
                zip: '12345')
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

    within('#item-link') do
      expect(page).to have_link('coffee')
    end

    within('#item-quantity') do
      expect(page).to have_content('1')
    end

    within('#item-subtotal') do
      expect(page).to have_content('$1')
    end

    within('#order-total') do
      expect(page).to have_content('Total: $1')
    end

    within('#order-created-date') do
      expect(page).to have_content("Order Sent: #{Order.last.date}")
    end

  end
end
