class AddChargeIntervalToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :charge_interval, :string, default: 'yearly'
  end
end
