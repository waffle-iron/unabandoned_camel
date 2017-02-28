class OrdersController < ApplicationController

  def create
    @order = current_user.orders.create(contents: @cart.contents,
                                       total_price: @cart.total_price
                                       )
    flash[:success] = 'Order was successfully placed'
    render :show
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end
end
