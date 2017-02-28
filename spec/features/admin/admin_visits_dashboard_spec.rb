require 'rails_helper'
# DatabaseCleaner.clean
describe "admin visits admin dashboard" do
  scenario "admin sees a list of all orders" do
        bean = Bean.create( id: 1, title: "Arabica", description:"fruity", price: 2, image:"http://gbp.com/wp-content/uploads/2014/03/Coffee-Bean-Bag.jpg")
        bean1 = Bean.create( id: 3, title: "Dark Roast", description:"fruity", price: 2, image:"http://gbp.com/wp-content/uploads/2014/03/Coffee-Bean-Bag.jpg")
        bean2 = Bean.create( id: 4, title: "Breakfast Blend", description:"fruity", price: 2, image:"http://gbp.com/wp-content/uploads/2014/03/Coffee-Bean-Bag.jpg")
        bean3 = Bean.create( id: 5, title: "French Roast", description:"fruity", price: 2, image:"http://gbp.com/wp-content/uploads/2014/03/Coffee-Bean-Bag.jpg")
        admin = User.create(email: 'admin@admin.com',
                            password: 'password',
                            role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


    order_one = Order.create(user_id: User.create(email:"hello@hello.com",
                            password: "password", id:1), contents: {"1"=>2},
                            total_price: 4, status: "Ordered")

    order_two = Order.create(user_id: User.create(email:"hello@hello.com",
                            password: "password", id:2), contents: {"3"=>2},
                            total_price: 4, status: "Paid")

    order_three = Order.create(user_id: User.create(email:"hello@hello.com",
                              password: "password", id:7), contents: {"4"=>2},
                              total_price: 4, status: "Cancelled")

    order_four = Order.create(user_id: User.create(email:"hello@hello.com",
                              password: "password", id:5), contents: {"5"=>2},
                              total_price: 4, status: "Completed")

    visit 'admin/dashboard'

    within (".order_list .orders:nth-child(1)") do
      expect(page).to have_content("Ordered")
      expect(page).to have_link("Order 1")
      # click_link("Paid")
      # expect(page).to have_content("Paid")
    end

    within (".order_list .orders:nth-child(2)") do
      expect(page).to have_content("Paid")
      expect(page).to have_link("Order 2")
      # click_link("Cancel")
      # expect(page).to have_content("Cancelled")
    end

    within (".order_list .orders:nth-child(3)") do
      expect(page).to have_content("Cancelled")
      expect(page).to have_link("Order 3")
    end

    within (".order_list .orders:nth-child(4)") do
      expect(page).to have_content("Completed")
      expect(page).to have_link("Order 4")
    end

    within(".order-status") do
      within("#ordered-count") do
        expect(page).to have_content(1)
      end

      within("#paid-count") do
        expect(page).to have_content(1)
      end

      within("#cancelled-count") do
        expect(page).to have_content(1)
      end

      within("#completed-count") do
        expect(page).to have_content(1)
      end
    end
  end
end








# As an Admin
# When I visit the dashboard
# Then I can see a listing of all orders
# And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
# And I can see a link for each individual order



# And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
# And I have links to transition between statuses
# - I can click on "cancel" on individual orders which are "paid" or "ordered"
# - I can click on "mark as paid" on orders that are "ordered"
# - I can click on "mark as completed" on orders that are "paid"
