class Cd < ActiveRecord::Base
  belongs_to :item_collection
  has_many :tracks, dependent: :destroy

  validates_presence_of :name, :artist, :editor, :gender

  validates :year, :inclusion => 1900..Date.today.year

  validates :item_collection_id, presence: true
  validate :max_purchaseDate

  validate :bugDate

  def max_purchaseDate
    if purchaseDate
      errors.add(:purchaseDate, "La date d'achat est dépassée.") if purchaseDate > Date.today
    end
  end

  def bugDate
    if purchaseDate && year
      errors.add(:purchaseDate, "La date d'achat est inférieure à l'année de parution") if purchaseDate.year < year
    end
  end

  has_attached_file :image, styles: {small: "64x64", med: "128x128", large: "256x256"}, :default_url => "cd/:style/missing.png"

  validates_attachment :image, :content_type => {:content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
end
