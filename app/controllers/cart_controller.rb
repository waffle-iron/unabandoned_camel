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
    #byebug
    @bean = Bean.all
  end

end