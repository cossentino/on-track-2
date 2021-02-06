module UsersHelper

  def email_form_field(form_object)
    if session[:user_id]
      signed_in_user.email
    else
      form_object.text_field :email
    end
  end

  def password_form_field(form_object)
      form_object.password_field(:password) if !session[:user_id]
  end

end
