class CreateHealthInformations < ActiveRecord::Migration
  def change
    create_table :health_informations do |t|
      t.date :last_dentist
      t.string :dentist_name
      t.string :dentist_phone
      t.integer :dentist_interval
      t.date :last_coggins
      t.date :last_deworming
      t.date :last_tetanus
      t.date :last_rabies
      t.date :last_vew
      t.date :last_botulism
      t.date :last_potomac
      t.date :last_strangles
      t.date :last_anthrax
      t.date :last_rhino_flu
      t.integer :rhino_interval
      t.date :last_west_nile
      t.integer :west_nile_interval
      t.text :other_vacc
      t.text :health_comments

      t.timestamps
    end
  end
end
