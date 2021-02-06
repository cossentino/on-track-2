class UsersController < ApplicationController

  before_action :user_verification

  def new
    render :new, locals: { user: User.new }
  end

  def dashboard
    @user = current_user
  end

  def edit
    render :edit, locals: { user: current_user }
  end

  def create
    user = User.new(user_params_for_sessions)
    if user.save
      session[:user_id] = user.id; redirect_to '/dashboard'
    else
      render :new, locals: { user: user }
    end
  end

  def update
    user = current_user
    if user.update(user_params)
      redirect_to '/dashboard'
    else
      render :edit, locals: { user: user }
    end
  end


  private

  def user_params_for_sessions
    params.require(:user).permit(:email, :password, :password_confirmation, :income, :first_name, :last_name)
  end
  
  def user_params
    params.require(:user).permit(:password, :password_confirmation, :income, :first_name, :last_name, :family_id)
  end
  
  
  def user_verification
    if params[:id]
      redirect_to root_path unless session[:user_id] == params[:id].to_i
    end
  end
  

end
