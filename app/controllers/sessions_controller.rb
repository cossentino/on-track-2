class SessionsController < ApplicationController
  
  def login
    if logged_in?
      redirect_to '/dashboard'
    else
      render :login, locals: { user: User.new }
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

  def sign_in_user
    user = User.find_by(email: user_params_for_sessions[:email])
    if user && user.authenticate(user_params_for_sessions[:password])
      set_session(user)
    else
      flash[:alert] = 'Error logging in, please try again'
      render :login, locals: { user: User.new }
    end
  end

  ##Create/login via oauth
  def oauth
    oauth_email = request.env['omniauth.auth']['info']['email']
    ## if user exists in database, ensure that it is also from social to avoid duplicate
    if user = User.find_by(email: oauth_email)
      if user.from_social != true
        flash[:alert] = 'Email is already associated with an account. Please try again'
        redirect_to root_path
      else
        login_from_social(user)
      end
    else
      create_from_social
    end
  end


  private

  def user_params_for_sessions
    params.require(:user).permit(:email, :password, :password_confirmation, :income, :first_name, :last_name)
  end

  def login_from_social(user)
    session[:user_id] = user.id
    session[:image] = request.env['omniauth.auth']['info']['image']
    redirect_to root_path
  end

  def create_from_social
    user = User.new.tap do |u|
      u.from_social = true
      u.email = request.env['omniauth.auth']['info']['email']
      u.first_name = request.env['omniauth.auth']['info']['first_name']
      u.last_name = request.env['omniauth.auth']['info']['last_name']
    end
    if user.save
      login_from_social(user)
    else
      flash[:alert] = 'Unable to create account. Please try again'
      redirect_to '/'
    end
  end



end
