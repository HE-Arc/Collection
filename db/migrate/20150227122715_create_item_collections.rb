class CreateItemCollections < ActiveRecord::Migration
  def change
    create_table :item_collections do |t|
      t.string :name
      t.date :beginDate
      t.references :user, index: true

      t.timestamps
    end
  end
end
