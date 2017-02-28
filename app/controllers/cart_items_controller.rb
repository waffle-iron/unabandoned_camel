class CartItemsController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    bean = Bean.find(params[:bean_id])
    cart.add_bean(bean)
    session[:cart] = cart.contents
    flash[:success] = "#{pluralize(@cart.count_of(bean.id), bean.title)} added to cart"
    redirect_to beans_path
  end

  def index
    @cart_items = cart.items
  end

end
