class Admin::DashboardController < Admin::BaseController
  def dashboard
    if params[:status_hold]
      @orders = Order.where(status: params[:status_hold])
      @order_list_title = params[:status_hold]
    else
      @orders = Order.order(:id)
      @order_list_title = "All Orders"
    end
    @all_orders = Order.order(:id)
    render :admin_dashboard
  end
end
