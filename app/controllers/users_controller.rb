class UsersController < ApplicationController

  before_action :user_verification

  def new
    @user = User.new
  end

  def dashboard
    puts session[:user_id]
    @user = current_user
  end

  def edit
    @user = current_user
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
    if current_user.update(user_params)
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


    def user_verification
      if params[:id]
        redirect_to root_path unless session[:user_id] == params[:id].to_i
      end
    end



end
