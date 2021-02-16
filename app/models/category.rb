class Category < ApplicationRecord
  has_many :purchases
  has_many :users, through: :purchases
  validates_presence_of :name


  def self.my_categories(user)
    Category
      .select('categories.name').distinct
      .joins(:purchases)
      .where('purchases.user_id = ?', user.id )
  end

end
