class AddUserIdToWeight < ActiveRecord::Migration
  def change
    add_column :weights, :user_id, :integer
  end
end
