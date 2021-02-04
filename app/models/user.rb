class User < ApplicationRecord
  has_secure_password
  belongs_to :family
  has_many :purchases
  has_many :categories, through: :purchases
end
