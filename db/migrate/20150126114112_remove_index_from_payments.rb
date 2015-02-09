class RemoveIndexFromPayments < ActiveRecord::Migration
  def change
    remove_index :payments, :user_id
  end
end
