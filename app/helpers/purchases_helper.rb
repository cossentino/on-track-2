module PurchasesHelper

  def current_month_total
    Purchase.current_month_purchases(signed_in_user).pluck(:total).sum
  end

end
