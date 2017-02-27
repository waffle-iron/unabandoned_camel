require 'rails_helper'

feature 'user views all past orders' do
  scenario 'user navigates to view single order information' do
    bean1 = create(:bean)
    bean2 = create(:bean)
    cart = Cart.new({"#{bean1.id}" => 3,
                      "#{bean2.id}" => 2})
    user = User.create(email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password',
                       first_name: 'First Test',
                       last_name: 'Last Test',
                       street: '123 Test St',
                       city: 'Test City',
                       state: 'Test State',
                       zip: '12345')
    order = user.orders.create(contents: cart.contents,
                                total_price: cart.total_price)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path
    click_button "View Order"

    expect(current_path).to eq order_path(order)

    within all('#item-link').first do
      expect(page).to have_link("#{bean1.title}")
    end

    within all('#item-link').last do
      expect(page).to have_link("#{bean2.title}")
    end

    within all('#item-quantity').first do
      expect(page).to have_content("3")
    end

    within all('#item-quantity').last do
      expect(page).to have_content("2")
    end

    within all('#item-subtotal').first do
      expect(page).to have_content("$#{bean1.subtotal(3)}")
    end

    within all('#item-subtotal').last do
      expect(page).to have_content("$#{bean2.subtotal(2)}")
    end

    within('#order-total') do
      expect(page).to have_content(order.total_price)
    end

    within('#order-status') do
      expect(page).to have_content(order.status)
    end

    within('#order-created-date') do
      expect(page).to have_content(order.date)
    end

    order.update_attributes(status: "Completed")

    visit order_path(order)

    within('#order-updated-date') do
      expect(page).to have_content("Order Updated to #{order.status} at #{order.update_time}")
    end

    order.update_attributes(status: "Cancelled")

    visit order_path(order)

    within('#order-updated-date') do
      expect(page).to have_content("Order Updated to #{order.status} at #{order.update_time}")
    end

  end
end
