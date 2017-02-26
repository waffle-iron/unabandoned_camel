class Admin::DashboardController < Admin::BaseController
  def dashboard
    render :admin_dashboard
  end
end
