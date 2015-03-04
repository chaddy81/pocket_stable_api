class ChangeLastFarrierType < ActiveRecord::Migration
  def change
    change_column :stable_informations, :last_farrier, :date
  end
end
