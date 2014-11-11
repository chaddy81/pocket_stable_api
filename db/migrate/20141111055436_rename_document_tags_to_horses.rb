class RenameDocumentTagsToHorses < ActiveRecord::Migration
  def change
    rename_column :documents, :tags, :horses
  end
end
