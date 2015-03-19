class Track < ActiveRecord::Base
  belongs_to :cd
  
  scope :trier, order("track_number").limit(20)
end
