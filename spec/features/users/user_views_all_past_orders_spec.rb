require 'rails_helper'

feature "user visits '/orders'" do
  scenario 'user sees their past orders' do
    bean1 = create(:bean)
    bean2 = create(:bean)
    cart1 = Cart.new({"#{bean1.id}" => 3,
                      "#{bean2.id}" => 2})
    cart2 = Cart.new({"#{bean1.id}" => 1,
                      "#{bean2.id}" => 1})
    user = User.create(email: 'test@test.com', password: 'password')
    order1 = user.orders.create(contents: cart1.contents,
                                total_price: cart1.total_price)
    order2 = user.orders.create(contents: cart2.contents,
                                total_price: cart2.total_price)

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
