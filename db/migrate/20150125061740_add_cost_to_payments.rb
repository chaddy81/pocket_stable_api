class AddCostToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :cost, :decimal, :precision => 8, :scale => 2
  end
end
