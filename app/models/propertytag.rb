class Propertytag < ActiveRecord::Base
	
	belongs_to :property
	belongs_to :tag

end