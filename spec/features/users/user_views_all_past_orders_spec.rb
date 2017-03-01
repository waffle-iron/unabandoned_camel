require 'rails_helper'

feature "user visits '/orders'" do
  scenario 'user sees their past orders' do
    bean1 = Bean.create(id: 1,
                        title:"Dark Roast",
                        description:"good",
                        price:1,
                        image:"123")
    bean2 = Bean.create(id: 2,
                        title:"Light Roast",
                        description:"great",
                        price:1,
                        image:"123")
    cart1 = Cart.new({"#{bean1.id}" => 3,
                      "#{bean2.id}" => 2})
    cart2 = Cart.new({"#{bean1.id}" => 1,
                      "#{bean2.id}" => 1})
    user = User.create(email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password',
                       first_name: 'First Test',
                       last_name: 'Last Test',
                       street: '123 Test St',
                       city: 'Test City',
                       state: 'Test State',
                       zip: '12345')
    order1 = Order.build_order(cart1, user)
    order2 = Order.build_order(cart2, user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path

    expect(page).to have_content('Order History')

    within all('#order-id').first do
      expect(page).to have_content(order1.id)
    end

    within all('#order-item-count').first do
      expect(page).to have_content(order1.item_count)
    end

    within all('#order-date').first do
      expect(page).to have_content(order1.date)
    end

    within all('#order-total').first do
      expect(page).to have_content(order1.total_price)
    end

    within all('#view-order-button').first do
      expect(page).to have_button('View Order')
    end

    within all('#order-id').last do
      expect(page).to have_content(order2.id)
    end

    within all('#order-item-count').last do
      expect(page).to have_content(order2.item_count)
    end

    within all('#order-date').last do
      expect(page).to have_content(order2.date)
    end

    within all('#order-total').last do
      expect(page).to have_content(order2.total_price)
    end

    within all('#view-order-button').last do
      expect(page).to have_button('View Order')
    end

  end
end
