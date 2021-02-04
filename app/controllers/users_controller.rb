class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def dashboard
    @user = User.find_by_id(current_user.id)
  end

  def edit
    @user = User.find_by_id(current_user.id)
  end

  def create
    user = User.new(user_params_for_sessions)
    if user.save
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:alert] = "There was an error saving your account. Please try again."
      redirect_to '/signup'
    end
  end

  def update
    user = User.find_by_id(current_user.id)
    if user.update(user_params)
      redirect_to '/dashboard'
    else
      flash[:alert] = "There was an error saving your account. Please try again."
      render :edit
    end
  end



  private

    def user_params_for_sessions
      params.require(:user).permit(:email, :password, :password_confirmation, :income, :first_name, :last_name)
    end

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :income, :first_name, :last_name, :family_id)
    end






end
