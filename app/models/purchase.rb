class Purchase < ApplicationRecord
  include ActiveModel::Validations
  validates_with TotalValidator
  belongs_to :user
  belongs_to :category, optional: true
  validates_presence_of :location, :total, :date



  def self.my_purchases_by_name(user)
    Purchase.where(user_id: user.id).order(:location)
  end
  

  def self.current_month
    Time.now.strftime('%m')
  end

  def self.current_year
    Time.now.strftime('%Y')
  end

  def self.last_day_of_month
    Date.civil(Time.now.year, Time.now.month, -1).day
  end

  def self.current_month_purchases(user)
    Purchase.where('purchases.date BETWEEN ? AND ?', "#{current_year}-#{current_month}-01", "#{current_year}-#{current_month}-#{last_day_of_month}").where('purchases.user_id = ?', user.id)
  end

  def category_attributes=(category_attributes)
    if !category_attributes[:name].empty?
      self.category = Category.find_or_create_by(name: category_attributes[:name])
      self.category.update(category_attributes)
    end
  end

end



