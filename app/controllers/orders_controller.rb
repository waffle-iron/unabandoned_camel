class OrdersController < ApplicationController

  def create
    @order = Order.build_order(@cart, current_user)
    flash[:success] = 'Order was successfully placed'
    session[:cart].clear
    render :show
  end

  def show
    if current_user == nil || !current_user.orders.include?(Order.find(params[:id]))
      render file: '/public/404'
    else
      @order = current_user.orders.find(params[:id])
      
      render :show
    end
  end

  def index
    @orders = current_user.orders
  end
end
