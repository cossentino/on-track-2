class SessionsController < ApplicationController
  def login
  end

  def logout
    reset_session
    redirect_to root_path
  end

  ##Create user via oauth and login via oauth in same method here
  def oauth
  end


end
