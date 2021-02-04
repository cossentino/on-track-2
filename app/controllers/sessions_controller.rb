class SessionsController < ApplicationController
  def login
    if logged_in?
      redirect_to '/dashboard'
    else
      @user = User.new
      render :login
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

  ##Create user via oauth and login via oauth in same method here
  def oauth
  end


end
