class AddFilenameToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :filename, :string
    add_column :documents, :horse_id, :integer
    add_index :documents, :horse_id
  end
end
