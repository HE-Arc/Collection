class Track < ActiveRecord::Base
  belongs_to :cd
  
  validates :track_number, :numericality => { :greater_than => 0 }
  
  validates_presence_of :track_number, :title
end
