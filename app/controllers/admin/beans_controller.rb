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
      render :new
    end
  end

  private

  def bean_params
    params.require(:bean).permit(:title, :description, :price)
  end
end