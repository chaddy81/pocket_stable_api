class RemoveHorseIdFromVeterinarians < ActiveRecord::Migration
  def up
    remove_column :veterinarians, :horse_id, :integer
  end
end
