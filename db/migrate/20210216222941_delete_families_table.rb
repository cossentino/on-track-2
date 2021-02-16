class DeleteFamiliesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :families
    remove_column :users, :family_id
  end
end
