class BeansController < ApplicationController

  def index
    @beans = Bean.all
  end

end