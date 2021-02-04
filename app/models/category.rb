class Category < ApplicationRecord
  has_many :purchases
  has_many :users, through: :purchases


  def self.my_categories(user)
    Category
      .select('categories.name').distinct
      .joins(:purchases)
      .where('purchases.user_id = ?', user.id )
  end

# SELECT DISTINCT name
# FROM categories
# INNER JOIN purchases
# ON categories.id = purchases.category_id
# WHERE purchases.user_id = 1





end
