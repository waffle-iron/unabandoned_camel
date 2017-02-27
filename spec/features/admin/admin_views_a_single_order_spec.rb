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
    user = User.create(email: 'test@test.com', password: 'password',
                       first_name: 'test_first_name',
                       last_name: 'test_last_name',
                       street: '123 Test Ave',
                       city: 'Test City',
                       state: 'Test State',
                       zip: '12345')
    order = user.orders.create(contents: cart.contents,
                               total_price: cart.total_price)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_order_path(order)


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

    within ('#user_name') do
      expect(page).to have_content('test_first_name')
      expect(page).to have_content('test_last_name')
    end

    within ('#user_address') do
      expect(page).to have_content('123 Test Ave')
      expect(page).to have_content('Test City')
      expect(page).to have_content('Test State')
      expect(page).to have_content('12345')
    end

    within ('#order-status') do
      expect(page).to have_content(order.status)
    end

    within ('#order-total') do
      expect(page).to have_content(order.total_price)
    end

  end
end
