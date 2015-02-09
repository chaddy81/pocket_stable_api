class AddCusIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :cus_id, :string
  end
end
