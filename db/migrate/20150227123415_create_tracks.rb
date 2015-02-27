class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :trackNumber
      t.references :cd, index: true

      t.timestamps
    end
  end
end
