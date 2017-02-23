class SessionsController < ApplicationController

  def new

  end

  def destroy
    session.clear
  end
end
