class Cd < ActiveRecord::Base
  belongs_to :item_collection
  has_many :tracks
  
  validates :name,
  presence:true
  
end
