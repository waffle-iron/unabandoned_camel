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

    within('#orders-table') do
      expect(page).to have_content(order1.id)
      expect(page).to have_content(order1.item_count)
      expect(page).to have_content(order1.date)
      expect(page).to have_content(order1.total_price)
      expect(page).to have_content(order2.id)
      expect(page).to have_content(order2.item_count)
      expect(page).to have_content(order2.date)
      expect(page).to have_content(order2.total_price)
    end

  end
end
