class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :card_last4

      t.timestamps null: false
    end

    add_index :payments, :user_id, unique: true
  end
end
