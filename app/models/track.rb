class Track < ActiveRecord::Base
  belongs_to :cd
  
  validates :track_number,
  presence:true
end
