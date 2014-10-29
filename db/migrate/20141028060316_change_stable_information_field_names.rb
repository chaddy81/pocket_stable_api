class ChangeStableInformationFieldNames < ActiveRecord::Migration
  def change
    rename_column :stable_informations, :last_ferrier, :last_farrier
    rename_column :stable_informations, :ferrier_name, :farrier_name
  end
end
