class UpdatePayments < ActiveRecord::Migration
  def change
    change_column :payments, :next_charge_date, 'date USING CAST(next_charge_date AS date)'
    remove_column :payments, :date
  end
end
