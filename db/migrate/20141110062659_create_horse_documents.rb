class CreateHorseDocuments < ActiveRecord::Migration
  def change
    create_table :horse_document do |t|
      t.integer :horse_id
      t.integer :document_id

      t.timestamps
    end
  end
end
