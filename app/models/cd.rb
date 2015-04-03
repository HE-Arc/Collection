class Cd < ActiveRecord::Base
  belongs_to :item_collection
  has_many :tracks, dependent: :destroy

  validates_presence_of :name, :artist, :editor, :gender
  
  validates :year, :inclusion => 1900..Date.today.year

  validate :max_purchaseDate
  
  validate :bugDate

  def max_purchaseDate
    if purchaseDate
      errors.add(:purchaseDate, "La date est dépassé.") if purchaseDate > Date.today
    end
  end
  
  def bugDate
    if purchaseDate && year
      errors.add(:purchaseDate, "La date d'achat est inférieur à l'année de parution") if purchaseDate.year < year
    end
  end
  
  validates :image, cover: {min_size: 300}

  has_attached_file :image, styles: {small: "64x64", med: "128x128", large: "256x256"}, :default_url => "cd/:style/missing.png"

  validates_attachment :image, :content_type => {:content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
end
