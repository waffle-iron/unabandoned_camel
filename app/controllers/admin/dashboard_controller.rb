class Admin::DashboardController < Admin::BaseController


  def dashboard
    @orders= Order.all
    @beans = Bean.all

    render :admin_dashboard
  end 
end
