class Track < ActiveRecord::Base
  belongs_to :cd
  
  before_save :add_cd_id
  
  #scope :trier, order("track_number").limit(20)
  
  def add_cd_id
      
  end
end
