module PurchasesHelper

  def my_categories
    Category.where(user_id: signed_in_user.id).uniq
  end


end
