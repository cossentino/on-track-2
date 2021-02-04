# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DATA = {
  :user_keys =>
    ["email", "first_name", "last_name", "from_social", "income", "family_id", "password"],
   :users => [
    ["mcharles@nyu.edu", "Max", "Charles", false,  60000, 1, "password"],
    ["sjackson@nyu.edu", "Skai", "Jackson", false, 670000, 1, "password"],
    ["kelam@nyu.edu", "Kaleo", "Elam", false, 60000, 1, "password"],
    ["mcharpentier@nyu.edu", "Megan", "Charpentier", false, 60000, 1, "password"],
    ["hbyerly@nyu.edu", "Hayden", "Byerly", false, 60000, 1, "password"],
    ["tnorgay@nyu.edu", "Tenzing", "Norgay Trainor", false, 60000, 1, "password"],
    ["dcleveland@nyu.edu", "Davis", "Cleveland", false, 60000, 1, "password"],
    ["csand@nyu.edu", "Cole", "Sand", false, 60000, 1, "password"],
    ["qwallis@nyu.edu", "Quvenzhané", "Wallis", false, 60000, 1, "password"]
  ],
  :purchase_keys =>
   ["place", "total", "user_id", "category_id", "note"],
  :purchases => [
    ["target", 217.6, 1, 1, 'welcome to target!'],
    ["walmart", 175.1, 2, 2, "test test"],
    ["market_basket", 26.0, 1, 1, "test test"],
    ["yankee_stadium", 175.75, 1, 2, "test test"],
    ["toys r us", 70.2, 1, 1, "test test"],
    ["wegmans", 37.5, 3, 2, "test test"],
    ["ralph lauren", 3000, 4, 1, "test test"],
    ["jcrew", 67.67, 5, 2, "test test"],
    ["rainforest cafe", 800.0, 9, 1, "test test"]
  ],
  :category_keys =>
  ["name"],
 :categories => [
   ["baseball"],
   ["food"]
 ]
}


def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_categories
  DATA[:categories].each do |cat|
    new_cat = Category.new
    cat.each_with_index do |attribute, i|
      new_cat.send(DATA[:category_keys][i]+"=", attribute)
    end
    new_cat.save
  end
end

def make_purchases
  DATA[:purchases].each do |pur|
    new_pur = Purchase.new
    pur.each_with_index do |attribute, i|
      new_pur.send(DATA[:purchase_keys][i]+"=", attribute)
    end
    new_pur.save
  end
end

make_users
make_categories
make_purchases