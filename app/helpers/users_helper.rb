module UsersHelper

  def email_field
    if session[:user_id]
      @user.email
    else
      f.text_field :email
    end
  end

end
