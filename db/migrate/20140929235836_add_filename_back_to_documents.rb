class AddFilenameBackToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :filename, :text
  end
end
