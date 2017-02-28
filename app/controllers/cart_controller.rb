class CartController < ApplicationController
include ActionView::Helpers::TextHelper

  def create
    bean = Bean.find(params[:bean_id])

    @cart.add_bean(bean.id)
    session[:cart] = @cart.contents

    flash[:success] = "#{pluralize(@cart.count_of(bean.id), bean.title)} added to cart"
    redirect_to beans_path
  end


  def index
    @cart_items = cart.items
    byebug
  end

  def destroy
    bean = Bean.find(params[:id])
    @cart.contents.delete(bean.id.to_s)

    flash[:danger] = "Successfully removed #{view_context.link_to bean.title, bean_path(bean)} from your cart."
    redirect_to cart_index_path
  end

  def update
    if params[:modify] == "1"
      @cart.contents[params[:id]] += params[:modify].to_i
    elsif params[:modify] == "-1"
      @cart.content[params[:id]] -= params[:modify].to_i
    end
    if params[:update].to_i > 1
      @cart.contents[params[:id]] = params[:update].to_i
    elsif params[:update].to_i == 0
      @cart.contents.delete(params[:id].to_s)
    else
      flash[:danger] = "Item quantity cannot be negative"
    end

    redirect_to cart_index_path
  end

end
