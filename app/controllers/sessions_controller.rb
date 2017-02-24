class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:bad_login] = 'Invalid Credentials'
      render :new
    end
  end

  def destroy
    session.clear
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
