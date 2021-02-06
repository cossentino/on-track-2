class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  validates_presence_of :location
  

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
    self.category = Category.find_or_create_by(name: category_attributes[:name])
    self.category.update(category_attributes)
  end

end



# "#{Purchase.current_year}-#{Purchase.current_month}-1", "#{current_year}-#{current_month}-#{last_day_of_month}")