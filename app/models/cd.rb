class Cd < ActiveRecord::Base
  belongs_to :item_collection
  has_many :tracks

  validates :name,
            presence: true

  validates :image, cover: { min_size: 300 }

  has_attached_file :image, styles: {small: "64x64", med: "128x128", large: "256x256"}, :default_url => "cd/:style/missing.png"

  validates_attachment :image, :presence => true,
                       :content_type => {:content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
end
