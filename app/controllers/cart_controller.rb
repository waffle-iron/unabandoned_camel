class CartController < ApplicationController
include ActionView::Helpers::TextHelper

  def create
    bean = Bean.find(params[:bean_id])

    @cart.add_bean(bean.id)
    session[:cart] = @cart.contents

    flash[:notice] = "#{pluralize(@cart.count_of(bean.id), bean.title)} added to cart"
    redirect_to beans_path
  end

  def index
    @bean = Bean.all
  end

  def destroy
    bean = Bean.find(params[:id])
    @cart.contents.delete(bean.id.to_s)

    flash[:success] = "Successfully removed #{view_context.link_to bean.title, bean_path(bean)} from your cart."
    redirect_to cart_index_path
  end

  def update
    byebug
    @cart.contents[params[:id]] = params[:update].to_i
    redirect_to cart_index_path
  end

end
