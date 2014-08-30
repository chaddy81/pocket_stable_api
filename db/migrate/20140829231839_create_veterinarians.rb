class CreateVeterinarians < ActiveRecord::Migration
  def change
    create_table :veterinarians do |t|
      t.string :name
      t.string :phone
      t.integer :horse_id
      t.timestamps
    end
    add_index :veterinarians, :horse_id
  end
end
