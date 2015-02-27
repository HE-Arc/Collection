class ItemCollection < ActiveRecord::Base
  belongs_to :user
  has_many :cds
end
