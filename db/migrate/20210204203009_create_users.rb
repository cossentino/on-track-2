class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :from_social
      t.string :first_name
      t.string :last_name
      t.integer :income
      t.integer :family_id

      t.timestamps
    end
  end
end
