class Property < ActiveRecord::Base
	
	belongs_to :user
	# has_many :users, through: :books
	
	has_many :books
	

	has_many :propertytags
	has_many :tags, through: :propertytags


	validates :property, presence: true

end