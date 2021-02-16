module PurchasesHelper

  def current_month_total
    Purchase.current_month_purchases(signed_in_user).pluck(:total).sum
  end

  def percent_of_income
    ((current_month_total / signed_in_user.income) * 100).round(1)
  end

end
