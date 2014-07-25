class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.string :nick_name
      t.string :sex
      t.string :fertility
      t.datetime :foaling_date
      t.string :color
      t.datetime :date_of_birth
      t.string :markings

      t.timestamps
    end
  end
end
