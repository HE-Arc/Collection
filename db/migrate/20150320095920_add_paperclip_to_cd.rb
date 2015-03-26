class AddPaperclipToCd < ActiveRecord::Migration
  def change
    add_attachment :cds, :image
  end
end
