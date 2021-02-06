class ApplicationController < ActionController::Base


  private


    def current_user
      User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def set_session(user)
      session[:user_id] = user.id
      redirect_to '/dashboard'
    end


end
