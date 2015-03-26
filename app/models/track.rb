class Track < ActiveRecord::Base
  belongs_to :cd
  
#  before_save :add_album_id
  
  validates :track_number,
  presence:true
  
#  def add_album_id
#    self.cd_id = 2
#  end
end
