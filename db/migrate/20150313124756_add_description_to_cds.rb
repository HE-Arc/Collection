class AddDescriptionToCds < ActiveRecord::Migration
  def change
    add_column :cds, :description, :string
  end
end
