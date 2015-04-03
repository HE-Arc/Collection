class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  #devise :database_authenticatable, :registerable, :confirmable, :recoverable, stretches: 20
  validates :pseudo, presence: true
  validates :email, presence: true
  validates_uniqueness_of :pseudo
  validate :max_birthDate
  
  has_many :item_collections, dependent: :destroy
  
  def max_birthDate
    if birthdate
      errors.add("La date de naissance ", "est invalide.") if birthdate > Date.today
    end
  end
end
