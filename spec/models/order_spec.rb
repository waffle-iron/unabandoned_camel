require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is created with contents as a hash" do
    cart = Cart.new({"1" => 2, "2" => 3})
    order = Order.create(contents: cart.contents)

    expect(order.contents.class).to eq(Hash)
  end
  it 'has a relationship with a user' do
    user = User.create(email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password',
                       first_name: 'First Test',
                       last_name: 'Last Test',
                       street: '123 Test St',
                       city: 'Test City',
                       state: 'Test State',
                       zip: '12345')
    order = user.orders.create()

    expect(order).to respond_to(:user)
  end
  it 'requires contents for validation' do
    order = Order.new(total_price: 1)

    expect(order).to be_invalid
  end
end
