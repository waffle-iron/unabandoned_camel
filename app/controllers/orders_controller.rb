class OrdersController < ApplicationController

  def create
    @order = Order.build_order(@cart, current_user)
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
