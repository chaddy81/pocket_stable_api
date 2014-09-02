class AddFilenameToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :filename, :string
    add_column :photos, :horse_id, :integer
    add_index :photos, :horse_id
  end
end
