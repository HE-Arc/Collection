class CreateCds < ActiveRecord::Migration
  def change
    create_table :cds do |t|
      t.string :artist
      t.string :name
      t.string :editor
      t.string :cover
      t.integer :year
      t.string :gender
      t.date :purchaseDate
      t.references :item_collection, index: true

      t.timestamps
    end
  end
end
