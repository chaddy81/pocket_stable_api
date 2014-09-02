class AddAvatarToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :avatar, :string
  end
end
