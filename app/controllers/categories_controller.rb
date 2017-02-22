class CategoriesController < ApplicationController

  def show
    @category = Category.friendly.find(params[:category_name])
  end
end
