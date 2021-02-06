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
    save_or_redirect(User.new(user_params_for_sessions), 'save', '/dashboard', '/signup' )
    if user.save
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      failure_redirect("There was an error saving your account. Please try again.", '/signup')
      flash[:alert] = "There was an error saving your account. Please try again."
      redirect_to '/signup'
    end
  end

  def update
    current_user.update(user_params) ? redirect_to '/dashboard' : failure_redirect("There was an error saving your account. Please try again.", '/signup')
  end



  private

    def failure_redirect(message, redirect_path)
      flash[:alert] = message
      redirect_to redirect_path
    end




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
