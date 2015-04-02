class ItemCollection < ActiveRecord::Base
  belongs_to :user
  has_many :cds
  
  def self.getPublicRandomCollection
    ItemCollection.where("is_private=false").sample
  end
end
