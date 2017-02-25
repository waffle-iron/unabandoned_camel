class HomeController < ApplicationController
#before_action :user! 


  def dashboard
    render :dashboard
  end

end
