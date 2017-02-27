require 'rails_helper'

feature 'admin views a single order' do
  scenario 'admin sees required order information' do
    admin = User.create(email: 'admin@admin.com',
                        password: 'password',
                        role: 1)
    bean1 = create(:bean)
    bean2 = create(:bean)
    cart = Cart.new({"#{bean1.id}" => 3,
                     "#{bean2.id}" => 2})
    user = User.create(email: 'test@test.com', password: 'password')
    order = user.orders.create(contents: cart.contents,
                               total_price: cart.total_price)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_order_path(order)

    expect(page).to have_content("#{bean1.title}")
    expect(page).to have_content('3')
    expect(page).to have_content("$#{bean1.subtotal(3)}")
    expect(page).to have_content("#{bean2.title}")
    expect(page).to have_content('2')
    expect(page).to have_content("#{bean2.subtotal(2)}")
    expect(page).to have_content('test_name')
    expect(page).to have_content('test_street_and_number')
    expect(page).to have_content('test_city')
    expect(page).to have_content('test_state')
    expect(page).to have_content('test_zipcode')
    expect(page).to have_content(order.total_price)
    expect(page).to have_content(order.status)

  end
end
