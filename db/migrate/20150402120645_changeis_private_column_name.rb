class ChangeisPrivateColumnName < ActiveRecord::Migration
  def change
    rename_column :item_collections, :isPrivate, :is_private
  end
end
