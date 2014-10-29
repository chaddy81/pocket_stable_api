class AddFieldsToStableInformation < ActiveRecord::Migration
  def change
    add_column :stable_informations, :last_ferrier, :datetime
    add_column :stable_informations, :ferrier_name, :string
    add_column :stable_informations, :farrier_phone, :string
    add_column :stable_informations, :farrier_interval, :integer
    add_column :stable_informations, :hay, :string
    add_column :stable_informations, :feed, :string
    add_column :stable_informations, :supplements, :text
    add_column :stable_informations, :horse_id, :integer
  end
end
