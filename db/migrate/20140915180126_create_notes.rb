class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.date :date
      t.time :start_time
      t.time :end_time
      t.text :content

      t.timestamps
    end
  end
end
