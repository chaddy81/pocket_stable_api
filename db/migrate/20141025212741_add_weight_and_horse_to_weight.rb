class AddWeightAndHorseToWeight < ActiveRecord::Migration
  def change
    add_column :weights, :weight, :integer
    add_column :weights, :horse_id, :integer
  end
end
