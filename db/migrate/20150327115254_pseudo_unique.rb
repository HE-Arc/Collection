class PseudoUnique < ActiveRecord::Migration
  def change
    add_index :users, :pseudo, :unique => true
  end
end
