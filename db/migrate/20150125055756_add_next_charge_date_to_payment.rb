class AddNextChargeDateToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :next_charge_date, :string
    add_column :payments, :date, :string
  end
end
