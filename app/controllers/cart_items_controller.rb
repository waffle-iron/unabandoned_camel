class CartItemsController < ApplicationController

  def create
    bean = Bean.find(params[:bean_id])
    cart.add_bean(bean)
    session[:cart] = cart.contents
    redirect_to beans_path
  end

  def index
    @cart_items = cart.items
  end
  
end
