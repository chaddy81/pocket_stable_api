class AddFieldsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :name, :string
    add_column :documents, :tags, :string
  end
end
