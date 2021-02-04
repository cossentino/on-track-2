class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.string :location
      t.float :total
      t.integer :user_id
      t.integer :category_id
      t.string :note
      t.date :date

      t.timestamps
    end
  end
end
