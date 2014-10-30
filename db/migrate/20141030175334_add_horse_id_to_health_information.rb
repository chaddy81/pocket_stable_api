class AddHorseIdToHealthInformation < ActiveRecord::Migration
  def change
    add_column :health_informations, :horse_id, :integer
  end
end
