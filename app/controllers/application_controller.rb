class ApplicationController < ActionController::Base


  private


    def current_user
      User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def user_verification
      if params[:user_id]
        redirect_to root_path unless session[:user_id] == params[:user_id].to_i
      end
    end
end
