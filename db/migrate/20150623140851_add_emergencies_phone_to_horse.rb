class AddEmergenciesPhoneToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :emergencies_phone, :string
  end
end
