class ItemCollection < ActiveRecord::Base
  belongs_to :user
  has_many :cds, dependent: :destroy

  def self.get_last_public_collection
    itemCollections = ItemCollection.where("is_private=false").order("RANDOM()")

    itemCollections.each do |itemCollection|
      if Cd.where(item_collection_id: itemCollection).size > 0
        return itemCollection
      end
    end
    return nil

  end
end
