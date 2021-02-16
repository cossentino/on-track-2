class User < ApplicationRecord
  has_secure_password validations: false
  validates :password, presence: true, unless: :from_social?
  validates_presence_of [:email, :first_name, :last_name]
  validates :email, uniqueness: true
  has_many :purchases
  has_many :categories, through: :purchases


  def from_social?
    self.from_social == true
  end


end
