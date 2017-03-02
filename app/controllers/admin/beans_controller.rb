class Admin::BeansController < Admin::BaseController

  def index
    @beans = Bean.all
  end
  
  def new
    @categories = Category.all
    @bean = Bean.new
  end

  def create
    @categories = Category.all    
    @bean = Bean.new(bean_params)
    if @bean.save
      flash[:success] = "Bean Added To Inventory."
      redirect_to admin_beans_path
    else 
      flash[:danger] = "Failed To Add Bean. Try Again."
      redirect_to new_admin_bean_path
    end
  end

    def edit
      @bean = Bean.find(params[:id])
    end

    def update
      @bean = Bean.find(params[:id])
      if @bean.update(bean_params)
        flash[:success] = "Bean updated successfully!"
        redirect_to admin_beans_path
      else
        flash[:danger] = "Update Failed. Try Again."
        redirect_to edit_admin_bean_path(@bean)
      end
    end
  private

  def bean_params
    params.require(:bean).permit(:title, :description, :price, :status)
  end

end