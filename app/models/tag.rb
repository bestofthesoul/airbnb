
class Tag < ActiveRecord::Base
  
  has_many :propertytags
  has_many :properties, through: :propertytags

   
  validates :name, :presence => true, :uniqueness => true
end