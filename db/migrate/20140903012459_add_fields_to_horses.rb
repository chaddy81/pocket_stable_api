class AddFieldsToHorses < ActiveRecord::Migration
  def change
    add_column :horses, :breed, :string
    add_column :horses, :registration_number, :string
    add_column :horses, :org_numbers, :string
    add_column :horses, :emergencies, :text
    add_column :horses, :comments, :text
  end
end
