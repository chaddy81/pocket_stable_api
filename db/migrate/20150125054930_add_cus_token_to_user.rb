class AddCusTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :cus_token, :string
    add_column :users, :string, :string
  end
end
