class Cd < ActiveRecord::Base
  belongs_to :item_collection
  
  validates :name,
  presence:true
  
end
