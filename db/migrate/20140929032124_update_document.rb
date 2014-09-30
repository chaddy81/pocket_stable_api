class UpdateDocument < ActiveRecord::Migration
  def change
    remove_column :documents, :horse_id
    add_column :documents, :user_id, :integer
  end
end
