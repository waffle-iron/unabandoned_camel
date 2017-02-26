class Admin::OrdersController < Admin::BaseController
  
  def update
    if Order.find(params[:id]).update(status: params[:status])
    redirect_to 'admin/dashboard'
    end
  end
end