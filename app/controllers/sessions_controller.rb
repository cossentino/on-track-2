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

  def sign_in_user
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:alert] = 'Error logging in, please try again'
      render :login
    end
  end


  ##Create user via oauth and login via oauth in same method here
  def oauth
  end


  private

  def user_params_for_sessions
    params.require(:user).permit(:email, :password, :password_confirmation, :income, :first_name, :last_name)
  end




end
