class AddIsPrivateItemCollection < ActiveRecord::Migration
  def change
    add_column :item_collections, :isPrivate, :boolean, :default => false
  end
end
