class Category < ApplicationRecord
  has_many :purchases
  has_many :users, through: :purchases


  def my_categories

SELECT DISTINCT name
FROM categories
INNER JOIN purchases
ON categories.id = purchases.category_id
WHERE purchases.user_id = 1





end
