require 'rails_helper'

describe 'when a visitor has items in the cart' do
  describe 'and visits the cart page' do
    it 'should have a link to login or create a user account' do

      @cart = Cart.new("12" => 1)

      visit cart_index_path

      within("#checkout") do
        expect(page).to have_content("Login or Create Account to Checkout")
      end
    end
  end
end
