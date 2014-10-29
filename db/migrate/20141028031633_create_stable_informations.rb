class CreateStableInformations < ActiveRecord::Migration
  def change
    create_table :stable_informations do |t|

      t.timestamps
    end
  end
end
