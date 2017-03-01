require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is created with a cart and user" do
    Bean.create(id: 1,
                title:"Dark Roast",
                description:"good",
                price:1,
                image:"123")
    Bean.create(id: 2,
                title:"Light Roast",
                description:"great",
                price:1,
                image:"123")
    cart = Cart.new({"1" => 2, "2" => 3})
    user = User.create(email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password',
                       first_name: 'First Test',
                       last_name: 'Last Test',
                       street: '123 Test St',
                       city: 'Test City',
                       state: 'Test State',
                       zip: '12345')
    order = Order.build_order(cart, user)

    expect(order).to be_valid
    expect(cart.class).to eq(Cart)
    expect(user.class).to eq(User)
  end
  it 'has a relationship with a user' do
    Bean.create(id: 1,
                title:"Dark Roast",
                description:"good",
                price:1,
                image:"123")
    Bean.create(id: 2,
                title:"Light Roast",
                description:"great",
                price:1,
                image:"123")
    user = User.create(email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password',
                       first_name: 'First Test',
                       last_name: 'Last Test',
                       street: '123 Test St',
                       city: 'Test City',
                       state: 'Test State',
                       zip: '12345')
    cart = Cart.new({"1" => 2, "2" => 3})

    order = Order.build_order(cart, user)

    expect(order).to respond_to(:user)
  end
end
