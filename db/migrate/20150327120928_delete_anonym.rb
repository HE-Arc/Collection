class DeleteAnonym < ActiveRecord::Migration
  def change
    remove_column :users, :anonym
    remove_column :users, :password
  end
end
