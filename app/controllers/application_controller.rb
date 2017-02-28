class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :cart

  helper_method :current_user


  def dashboard
   render :dashboard
  end

  def cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user!
    render file: '/public/404' unless current_user
  end

  def current_admin?
  current_user && current_user.admin?
  end
end
