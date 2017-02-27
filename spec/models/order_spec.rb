`require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is created with contents as a hash" do
    cart = Cart.new({"1" => 2, "2" => 3})
    order = Order.create(contents: cart.contents)

    expect(order.contents.class).to eq(Hash)
  end
  it 'has a relationship with a user' do
    user= User.create(email: 'test@test.com',
                      password: 'password')
    order = user.orders.create()

    expect(order).to respond_to(:user)
  end
  it 'requires contents for validation' do
    order = Order.new(total_price: 1)

    expect(order).to be_invalid
  end
end
