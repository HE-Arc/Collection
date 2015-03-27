class User < ActiveRecord::Base
    devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  #devise :database_authenticatable, :registerable, :confirmable, :recoverable, stretches: 20
  validates :pseudo, presence: true
  validates :email, presence: true
  validates_uniqueness_of :pseudo
  
  has_many :item_collections, dependent: :destroy
end
