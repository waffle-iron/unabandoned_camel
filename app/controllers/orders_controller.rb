class OrdersController < ApplicationController

  def create
    @order = current_user.orders.create(contents: @cart.contents,
                                       total_price: @cart.total_price
                                       )
    flash[:order_placed] = 'Order was successfully placed'
    render :show
  end
end
