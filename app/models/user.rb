class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  #devise :database_authenticatable, :registerable, :confirmable, :recoverable, stretches: 20
  validates :pseudo, presence: true
  validates :email, presence: true
  validates_uniqueness_of :pseudo
  validates_confirmation_of :password
  
  has_many :item_collections, dependent: :destroy
end
