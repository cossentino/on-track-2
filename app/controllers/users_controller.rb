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
    save_or_redirect('save', '/dashboard', '/signup' )
    # if user.save
    #   session[:user_id] = user.id
    #   redirect_to '/dashboard'
    # else
    #   flash[:alert] = "There was an error saving your account. Please try again."
    #   redirect_to '/signup'
    # end
  end

  def update
    user = current_user
    save_or_redirect('update', '/dashboard', edit_user_path(current_user))
  end



  private

    def save_or_redirect(method, success_redirect, failure_redirect)
      if user.send(method)
        !!session[:user_id] ?  nil : session[:user_id] = user.id
        redirect_to success_redirect
      else
        flash[:alert] = "There was an error saving your account. Please try again."
        redirect_to failure_redirect
      end
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
