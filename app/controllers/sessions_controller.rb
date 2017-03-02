class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      if current_user.role == "admin"
        redirect_to admin_dashboard_path
      else
        redirect_to '/dashboard'
      end
    else
      flash[:danger] = 'Invalid Credentials'
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "You've logged out.  Come back soon!"
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
