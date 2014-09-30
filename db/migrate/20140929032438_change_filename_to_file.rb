class ChangeFilenameToFile < ActiveRecord::Migration
  def change
    rename_column :documents, :filename, :file
  end
end
