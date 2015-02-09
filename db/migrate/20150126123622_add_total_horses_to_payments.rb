class AddTotalHorsesToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :total_horses, :integer, default: 1
  end
end
