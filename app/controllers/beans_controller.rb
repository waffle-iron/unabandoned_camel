class BeansController < ApplicationController

  def index
    @beans = Bean.active
  end

  def show
    @bean = Bean.find(params[:id])
  end
    
  
end
